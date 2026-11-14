import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/Categories.dart';
import 'package:gerphis_game/Functions/WordScrambler.dart';
import 'package:gerphis_game/Pages/Levels/Level1Files/Buttons.dart';
import 'package:gerphis_game/Pages/Levels/Level1Files/LoadingLvl1.dart';
import 'package:gerphis_game/core/Widgets/CustomDialogs.dart';
import 'package:gerphis_game/core/Widgets/Snakcbar.dart';
import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  List<String> userTyped = [];
  int curLevel = 0;
  int curDifficulty = 2;
  int hintsRemaining = 5;
  int counter = 5;

  late int totalLetters = Category1.wordsToGuess[curLevel]
      .replaceAll(RegExp(r'\s+'), '')
      .length;

  Timer? _timer;
  void kyboardPressed(String userInput) {
    //add pinaka bago tinype ni user
    //limit amount of letters na pwede ma type
    print("total let = $totalLetters");
    if (userTyped.length < totalLetters) userTyped.add(userInput);
    print(userTyped);
    setState(() {});
  }

  void backspacePressed() {
    //remove pinaka huli na tinype ni user
    //limit amoutn of letters na pwede alisin
    if (userTyped.isNotEmpty) userTyped.removeAt(userTyped.length - 1);

    setState(() {});
  }

  void checkPressed() {
    String userimput = userTyped.join();
    String answerkey = Category1.wordsToGuess[curLevel].replaceAll(
      RegExp(r'\s+'),
      '',
    );
    if (userimput == answerkey) {
      setState(() {
        userTyped.clear();
        curLevel++;
        totalLetters = Category1.wordsToGuess[curLevel]
            .replaceAll(RegExp(r'\s+'), '')
            .length;
      });
      dialogBox(context, "CONGRATS!", Category1.funFacts[curLevel]);
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

    print("$userimput = $answerkey, [${userimput = answerkey}]");
  }

  void hintPressed() {
    dialogBox(context, "Hint!", Category1.hints[curLevel]);
    setState(() => hintsRemaining--);
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
    return counter == 0
        ? Scaffold(
            body: SafeArea(
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      category,
                      const SizedBox(height: 8),
                      lvlRmaining,
                      const SizedBox(height: 16),
                      HintsPill(hints: hintsRemaining),

                      Expanded(
                        child: Center(
                          child: DisplayWords(
                            key: ValueKey(curLevel),
                            curLvl: curLevel,
                          ),
                        ),
                      ),

                      AnswerInput(
                        curLvl: curLevel,
                        userInput: userTyped,
                        pressedHints: hintPressed,
                        pressedCheck: checkPressed,
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
            ),
          )
        : LVL1LoadingWidget();
  }

  Widget get category {
    return SizedBox(
      width: 300,
      child: Tagesschrift(
        textAlign: TextAlign.center,
        text: "Category: ${Category1.category}",
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
        text: "Lvl: ${curLevel + 1} / 5",
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

class DisplayWords extends StatefulWidget {
  final int curLvl;
  const DisplayWords({required this.curLvl, super.key});

  @override
  State<DisplayWords> createState() => _DisplayWordsState();
}

class _DisplayWordsState extends State<DisplayWords> {
  static double contwidth = 30;
  static double contHeight = 40;
  late final scrambled = scramble(Category1.wordsToGuess[widget.curLvl].trim());
  late final wordList = scrambled.split(RegExp(r'\s+'));
  //Split the strings into Words
  //display as many words in a row as possible..., if it doesent fit,
  //then dapat next words will be a row below

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 8,
      spacing: 24, // gap between words
      children: [
        for (final word in wordList)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final letter in word.split(''))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: contwidth,
                    height: contHeight,
                    decoration: BoxDecoration(
                      color: MyColors.parchmentDark.withValues(alpha: 0.5),
                    ),
                    child: Center(
                      child: Roboto(
                        text: letter,
                        fontsize: Fontsize.mobileH2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class AnswerInput extends StatefulWidget {
  final int curLvl;
  final List<String> userInput;
  final VoidCallback pressedHints;
  final VoidCallback pressedCheck;
  const AnswerInput({
    required this.curLvl,
    required this.userInput,
    super.key,
    required this.pressedHints,
    required this.pressedCheck,
  });

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {
  static double contwidth = 30;
  static double contHeight = 40;

  Widget _buildSlots() {
    //
    final wordList = Category1.wordsToGuess[widget.curLvl].trim().split(
      RegExp(r'\s+'),
    );

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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: contwidth,
              height: contHeight,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: MyColors.ink, width: 2),
                ),
              ),
              child: Center(
                child: Roboto(
                  text: typed,
                  fontsize: Fontsize.mobileH2,
                  fontWeight: FontWeight.bold,
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
      spacing: 24,
      children: wordWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSlots(),
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

  static const _rows = ['QWERTYUIOP', 'ASDFGHJKL', 'ZXCVBNM'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                        child: const Icon(Icons.backspace_outlined, size: 20),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
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
