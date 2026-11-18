import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/CategorieList.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fonts.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

Future<void> dialogBox(
  BuildContext context,
  bool isHint,
  String title,
  String message,
) async {
  final result = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: MyColors.amber, width: 2),
      ),
      backgroundColor: MyColors.parchmentDark,
      elevation: 10,

      title: PtSerif(
        text: title,
        fontWeight: FontWeight.bold,
        fontsize: Fontsize.mobileH1,

        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isHint
              ? SizedBox.shrink()
              : PtSerif(
                  text: "DID YOU KNOW?",
                  fontWeight: FontWeight.w500,
                  fontsize: Fontsize.mobileH3,
                  textAlign: TextAlign.center,
                ),
          const SizedBox(height: 10),
          PtSerif(
            text: message,
            fontWeight: FontWeight.w500,
            fontsize: Fontsize.mobileH3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
    ),
  );

  if (result == null) {}
}

Future<void> finishedDialog(
  BuildContext context,
  String title,
  String message,
  String funfact,
) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: MyColors.amber, width: 2),
      ),
      backgroundColor: MyColors.parchmentDark,
      elevation: 10,

      title: PtSerif(
        text: title,
        fontWeight: FontWeight.bold,
        fontsize: Fontsize.mobileH1,

        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PtSerif(
            text: "DID YOU KNOW?",
            fontWeight: FontWeight.w500,
            fontsize: Fontsize.mobileH3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          PtSerif(
            text: funfact,
            fontWeight: FontWeight.w500,
            fontsize: Fontsize.mobileH3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          PtSerif(
            text: message,
            fontWeight: FontWeight.bold,
            fontsize: Fontsize.mobileH3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
              //pop screen current stack
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.parchment,
              foregroundColor: MyColors.ink,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: const StadiumBorder(),
            ),
            child: PtSerif(
              text: "Return Home",
              fontsize: 14,
              fontWeight: FontWeight.bold,
              spacing: 1,
              fontcolor: MyColors.ink,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
    ),
  );
}
