import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/Categories.dart';

import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

class LoadingPageWidget extends StatefulWidget {
  final int categorycount;
  const LoadingPageWidget({required this.categorycount, super.key});

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> {
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
              text: "Level ${widget.categorycount}!",
              fontsize: Fontsize.mobileH1,
              fontcolor: categories[widget.categorycount].displayColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            Tagesschrift(
              text:
                  "Difficulty - ${categories[widget.categorycount].difficulty}",
              fontsize: Fontsize.mobileH3,
              fontcolor: categories[widget.categorycount].displayColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
