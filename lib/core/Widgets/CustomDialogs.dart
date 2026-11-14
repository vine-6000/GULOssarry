import 'package:flutter/material.dart';
import 'package:gerphis_game/Functions/Categories.dart';
import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fonts.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

Future<void> dialogBox(
  BuildContext context,
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
      content: PtSerif(
        text: message,
        fontWeight: FontWeight.w500,
        fontsize: Fontsize.mobileH3,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
    ),
  );

  if (result == null) {}
}
