import 'package:flutter/material.dart';

import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';


class LVL1LoadingWidget extends StatefulWidget {
  const LVL1LoadingWidget({super.key});

  @override
  State<LVL1LoadingWidget> createState() => _LVL1LoadingWidgetState();
}

class _LVL1LoadingWidgetState extends State<LVL1LoadingWidget> {
  static const double containerSize = 10;

  List<Color> myColors = [
    MyColors.gold,
    MyColors.ink,
    MyColors.parchment.withValues(red: 100),
    MyColors.parchmentDark,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tagesschrift(
              text: "Level 1!",
              fontsize: Fontsize.mobileH1,
              fontcolor: MyColors.moss,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            Tagesschrift(
              text: "Difficulty - Easy",
              fontsize: Fontsize.mobileH3,
              fontcolor: MyColors.moss,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
