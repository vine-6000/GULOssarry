import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/CategorieList.dart';

import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

class LoadingPageWidget extends StatefulWidget {
  final int categorycount;
  const LoadingPageWidget({required this.categorycount, super.key});

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget>
    with SingleTickerProviderStateMixin {
  static const double containerSize = 15;
  static const double jumpHeight = 20; // how high each box jumps
  static const int boxCount = 5;
  static const int jumps = 5; // jumps per box during the 4 seconds
  static const double stagger = 0.12; // delay between neighboring boxes

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..forward();
  late final List<Color> myColors = [
    for (int i = 0; i < boxCount; i++)
      Color.lerp(MyColors.parchment, MyColors.ink, i / (boxCount - 1))!,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 0 -> jumpHeight -> 0 for one jump, shifted per box to make the wave
  double _boxOffset(int i, double t) {
    final phase = t - i * stagger;
    if (phase < 0 || phase >= jumps) {
      return 0;
    }

    final frac = phase - phase.floor();
    return math.sin(frac * math.pi) * jumpHeight;
  }

  @override
  Widget build(BuildContext context) {
    final cat = categories[widget.categorycount];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tagesschrift(
              text: "Level ${widget.categorycount + 1}!",
              fontsize: Fontsize.mobileH1,
              fontcolor: cat.displayColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            Tagesschrift(
              text: "Difficulty - ${cat.difficulty}",
              fontsize: Fontsize.mobileH3,
              fontcolor: cat.displayColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 40),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                // stretch time so the last box finishes its final jump too
                final t =
                    _controller.value * (jumps + stagger * (boxCount - 1));

                return SizedBox(
                  height: containerSize + jumpHeight, // room for the jump
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i < boxCount; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Transform.translate(
                            offset: Offset(0, -_boxOffset(i, t)),
                            child: Container(
                              width: containerSize,
                              height: containerSize,
                              decoration: BoxDecoration(
                                color: myColors[i],
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: MyColors.ink.withValues(alpha: 0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
