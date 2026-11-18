import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/CategorieList.dart';
import 'package:gerphis_game/Functions/WordScrambler.dart';
import 'package:gerphis_game/Pages/LevelManager/Buttons.dart';
import 'package:gerphis_game/Pages/LevelManager/LoadingPage.dart';
import 'package:gerphis_game/core/Widgets/CustomDialogs.dart';
import 'package:gerphis_game/core/Widgets/Snakcbar.dart';
import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

class LevelDisplay extends StatefulWidget {
  final int categorycount;
  final Color displayColor;
  const LevelDisplay({
    required this.categorycount,
    required this.displayColor,
    super.key,
  });

  @override
  State<LevelDisplay> createState() => _LevelDisplayState();
}

class _LevelDisplayState extends State<LevelDisplay> {
  List<String> userTyped = [];
  int curQuestionCount = 0;
  late int curCategory = widget.categorycount;
  late int hintsRemaining = levelHintamount;

  //Main
  String get levelCategory => categories[curCategory].category;
  String get levelDifficulty => categories[curCategory].difficulty;
  String get levelwordtoguess =>
      categories[curCategory].items[curQuestionCount].word;
  String get levelHint => categories[curCategory].items[curQuestionCount].hint;
  String get levelFact =>
      categories[curCategory].items[curQuestionCount - 1].fact;
  int get levelHintamount => categories[curCategory].hintCount;

  //sub
  int get totalQuestionCount => categories[curCategory].items.length;
  int get totalCategoryCount => categories.length;
  String get answerkey => levelwordtoguess.replaceAll(RegExp(r'\s+'), '');
  int get lettersCount =>
      levelwordtoguess.replaceAll(RegExp(r'\s+'), '').length;
  late int totalLetters = lettersCount;

  void kyboardPressed(String userInput) {
    if (userTyped.length < lettersCount) {
      setState(() => userTyped.add(userInput));
    }
  }

  void backspacePressed() {
    if (userTyped.isNotEmpty) {
      setState(() => userTyped.removeAt(userTyped.length - 1));
    }
  }

  void checkPressed() {
    String userimput = userTyped.join();

    if (userimput == answerkey) {
      if (curQuestionCount == (totalQuestionCount - 1)) {
        //Show this after the last question
        finishedDialog(context, "CONGRATS!", "Level 1 Finished!", levelFact);
        showBeautifulSnackBar(
          context,
          message: "CORRECT!!",
          type: SnackBarType.success,
        );
        return;
      }
      setState(() {
        userTyped.clear();
        curQuestionCount++;
        totalLetters = levelwordtoguess.replaceAll(RegExp(r'\s+'), '').length;
      });
      dialogBox(context, false, "CONGRATS!", levelFact);
      showBeautifulSnackBar(
        context,
        message: "CORRECT!!",
        type: SnackBarType.success,
      );
    } else {
      showBeautifulSnackBar(
        context,
        message: "Wrong answer :(",
        type: SnackBarType.error,
      );
    }
  }

  void hintPressed() {
    if (hintsRemaining == 0) {
      showBeautifulSnackBar(
        context,
        message: "You have ran out of Hints!",
        type: SnackBarType.info,
      );
      return;
    }
    dialogBox(context, true, "Hint!", levelHint);
    setState(() => hintsRemaining--);
  }

  int timerCounter = 4;
  Timer? _timer;
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCounter > 0) {
        setState(() {
          timerCounter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return timerCounter == 0
        ? Scaffold(
            body: SafeArea(
              child: SizedBox.expand(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            category,
                            const SizedBox(height: 8),
                            lvlRmaining,
                            const SizedBox(height: 16),
                            HintsPill(hints: hintsRemaining),
                            const SizedBox(height: 26),
                            Expanded(
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DisplayWords(
                                        key: ValueKey(curQuestionCount),
                                        levelword: levelwordtoguess,
                                      ),
                                      const SizedBox(height: 26),
                                      AnswerInput(
                                        levelWord: levelwordtoguess,
                                        userInput: userTyped,
                                        pressedHints: hintPressed,
                                        pressedCheck: checkPressed,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GameKeyboard(
                      onKey: kyboardPressed,
                      onBackspace: backspacePressed,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          )
        : LoadingPageWidget(categorycount: widget.categorycount);
  }

  Widget get category {
    return SizedBox(
      width: 300,
      child: Tagesschrift(
        textAlign: TextAlign.center,
        text: "Category: $levelCategory",
        fontsize: Fontsize.mobileH3,
      ),
    );
  }

  Widget get lvlRmaining {
    return SizedBox(
      width: 300,
      child: Roboto(
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
        text: "Word: ${curQuestionCount + 1} / $totalQuestionCount",
        fontsize: Fontsize.mobileBody,
      ),
    );
  }
}

class HintsPill extends StatelessWidget {
  final int hints;
  final VoidCallback? onUseHint;

  const HintsPill({super.key, required this.hints, this.onUseHint});

  @override
  Widget build(BuildContext context) {
    final enabled = hints > 0 && onUseHint != null;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
      decoration: BoxDecoration(
        color: MyColors.parchmentDark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PtSerif(
            text: "HINTS: $hints",
            fontsize: 13,
            fontWeight: FontWeight.bold,
            spacing: 1,
            fontcolor: MyColors.ink,
          ),
          const SizedBox(width: 12),
          Container(
            width: 1,
            height: 20,
            color: MyColors.ink.withValues(alpha: 0.3),
          ),
          const SizedBox(width: 8),
          InkWell(
            customBorder: const CircleBorder(),
            onTap: enabled ? onUseHint : null,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: MyColors.ink.withValues(alpha: enabled ? 0.6 : 0.25),
                ),
              ),
              child: Icon(
                Icons.visibility_outlined,
                size: 18,
                color: MyColors.ink.withValues(alpha: enabled ? 1 : 0.35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double tileWidthFor(
  String phrase,
  double maxWidth, {
  double maxTile = 30,
  double minTile = 8,
  double gap = 4, // padding on each side of a tile
}) {
  final words = phrase.trim().split(RegExp(r'\s+'));
  final longest = words.map((w) => w.length).reduce((a, b) => a > b ? a : b);
  final fit = maxWidth / longest - gap * 2;
  return fit.clamp(minTile, maxTile).toDouble();
}

class DisplayWords extends StatefulWidget {
  final String levelword;
  const DisplayWords({required this.levelword, super.key});

  @override
  State<DisplayWords> createState() => _DisplayWordsState();
}

class _DisplayWordsState extends State<DisplayWords> {
  late final scrambled = scramble(widget.levelword.trim());
  late final wordList = scrambled.split(RegExp(r'\s+'));
  //Split the strings into Words
  //display as many words in a row as possible..., if it doesent fit,
  //then dapat next words will be a row below
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 4.0;
        final w = tileWidthFor(
          widget.levelword,
          constraints.maxWidth,
          gap: gap,
        );
        final h = w * 4 / 3;

        return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 16,
          children: [
            for (final word in wordList)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final letter in word.split(''))
                    Padding(
                      padding: const EdgeInsets.all(gap),
                      child: Container(
                        width: w,
                        height: h,
                        decoration: BoxDecoration(
                          color: MyColors.parchmentDark.withValues(alpha: 0.5),
                        ),
                        child: Center(
                          child: FittedBox(
                            // shrinks the letter with the tile
                            fit: BoxFit.scaleDown,
                            child: Roboto(
                              text: letter,
                              fontsize: Fontsize.mobileH2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

class AnswerInput extends StatefulWidget {
  final String levelWord;

  final List<String> userInput;
  final VoidCallback pressedHints;
  final VoidCallback pressedCheck;
  const AnswerInput({
    required this.levelWord,
    required this.userInput,
    required this.pressedHints,
    required this.pressedCheck,
    super.key,
  });

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {
  Widget _buildSlots(double maxWidth) {
    const gap = 4.0;
    final w = tileWidthFor(widget.levelWord, maxWidth, gap: gap);
    final h = w * 4 / 3;

    final wordList = widget.levelWord.trim().split(RegExp(r'\s+'));
    int index = 0; // counts every letter slot across all words
    final wordWidgets = <Widget>[];

    for (final word in wordList) {
      final slots = <Widget>[];

      for (int i = 0; i < word.length; i++) {
        final typed = index < widget.userInput.length
            ? widget.userInput[index]
            : ""; // empty slot, only the underline shows

        slots.add(
          Padding(
            padding: const EdgeInsets.all(gap),
            child: Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: MyColors.ink, width: 2),
                ),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Roboto(
                    text: typed,
                    fontsize: Fontsize.mobileH2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );

        index++;
      }

      wordWidgets.add(Row(mainAxisSize: MainAxisSize.min, children: slots));
    }

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 8,
      spacing: 16,
      children: wordWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(
            builder: (context, constraints) =>
                _buildSlots(constraints.maxWidth),
          ),
          const SizedBox(height: 24),
          HintandCheckButtons(
            onHint: widget.pressedHints,
            onCheck: widget.pressedCheck,
          ),
        ],
      ),
    );
  }
}

class GameKeyboard extends StatelessWidget {
  final void Function(String letter) onKey;
  final VoidCallback onBackspace;

  const GameKeyboard({
    super.key,
    required this.onKey,
    required this.onBackspace,
  });

  static const _rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBÑNM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.parchment,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(
              0,
              -6,
            ), // negative y = shadow above the container
            blurRadius: 8,
            spreadRadius:
                -4, // pulls the shadow in from the left and right edges
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 5, 24, 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const gap = 6.0;
            final keyWidth = constraints.maxWidth / 10 - gap;
            final keyHeight = keyWidth * 1.3;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int r = 0; r < _rows.length; r++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: gap / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final letter in _rows[r].split(''))
                          _Key(
                            width: keyWidth,
                            height: keyHeight,
                            gap: gap,
                            onTap: () => onKey(letter),
                            child: Roboto(
                              text: letter,
                              fontsize: Fontsize.mobileH3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        // backspace sits at the end of the last row
                        if (r == _rows.length - 1)
                          _Key(
                            width: keyWidth,
                            height: keyHeight,
                            gap: gap,
                            onTap: onBackspace,
                            child: const Icon(
                              Icons.backspace_outlined,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Key extends StatelessWidget {
  final double width;
  final double height;
  final double gap;
  final VoidCallback onTap;
  final Widget child;

  const _Key({
    required this.width,
    required this.height,
    required this.gap,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap / 2),
      child: Material(
        color: MyColors.parchmentDark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
