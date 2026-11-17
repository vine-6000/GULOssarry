import 'package:flutter/material.dart';
import 'package:gerphis_game/Pages/LevelManager/LevelDisplay.dart';
import 'package:gerphis_game/core/Widgets/Snakcbar.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fonts.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';
import '../../Functions/Categories.dart';

class Levelchoice extends StatelessWidget {
  const Levelchoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: .topCenter,
                  child: ChlakFont1(
                    text: "Pumili ng Antas",
                    fontWeight: FontWeight.bold,
                    fontsize: Fontsize.mobileH1,
                  ),
                ),
                SizedBox(height: 16),

                for (final (i, placeholder) in categories.indexed)
                  _LevelCard(
                    level: i + 1,
                    categories: placeholder,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelDisplay(
                            categorycount: i,
                            displayColor: placeholder.displayColor,
                          ),
                        ),
                      );
                      if (i != 0) {
                        showBeautifulSnackBar(
                          context,
                          message:
                              "THIS LEVEL HAS NOT BEEN PROPERLY TESTED BY ME ;-; EXPECT BUGS (or sana wala)",
                          type: SnackBarType.warning,
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final int level;
  final Category categories;
  final VoidCallback onTap;

  const _LevelCard({
    required this.level,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      color: MyColors.parchmentDark.withValues(alpha: 0.4),
      clipBehavior:
          Clip.antiAlias, // keeps the ripple inside the rounded corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: categories.displayColor, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PtSerif(
                      text: "Level $level - ${categories.difficulty}",
                      fontcolor: categories.displayColor,
                      fontWeight: FontWeight.bold,
                      fontsize: Fontsize.mobileH2,
                    ),
                    const SizedBox(height: 4),
                    Roboto(
                      text: categories.category,
                      fontWeight: FontWeight.bold,
                      fontsize: Fontsize.mobileH2,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.play_circle_fill_rounded,
                color: categories.displayColor,
                size: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
