import 'package:flutter/material.dart';

import 'package:gerphis_game/core/constants/Fonts.dart';
import 'package:gerphis_game/core/constants/colors.dart';

class HintandCheckButtons extends StatelessWidget {
  final VoidCallback onHint;
  final VoidCallback onCheck;
  final bool disableHintButton;

  const HintandCheckButtons({
    super.key,
    required this.onHint,
    required this.onCheck,
    required this.disableHintButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PillButton(
          label: "HINT",
          onPressed: onHint,
          background: MyColors.parchmentDark.withValues(alpha: 0.5),
          foreground: MyColors.ink,
          disablebutton: disableHintButton,
        ),
        const SizedBox(width: 16),
        _PillButton(
          label: "CHECK",
          onPressed: onCheck,
          background: MyColors.brick,
          foreground: MyColors.parchment,
          disablebutton: false,
        ),
      ],
    );
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color background;
  final Color foreground;
  final bool disablebutton;

  const _PillButton({
    required this.label,
    required this.onPressed,
    required this.background,
    required this.foreground,
    required this.disablebutton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disablebutton ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: const StadiumBorder(),
      ),
      child: PtSerif(
        text: label,
        fontsize: 14,
        fontWeight: FontWeight.bold,
        spacing: 1,
        fontcolor: foreground,
      ),
    );
  }
}
