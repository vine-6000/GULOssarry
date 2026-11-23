import 'package:flutter/material.dart';
import 'package:gerphis_game/Pages/LevelManager/LevelChoice.dart';

import 'package:gerphis_game/core/constants/colors.dart';
import 'package:gerphis_game/core/constants/fonts.dart';
import 'package:gerphis_game/core/constants/fontsizes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void _onStart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Levelchoice()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.1,
            colors: [MyColors.parchment, MyColors.parchmentDark],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.gold, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_balance, size: 64),
                  const SizedBox(height: 24),
                  ChlakFont1(
                    text: "GULOssary",
                    fontsize: Fontsize.mobileH1,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 12),
                  const PtSerif(
                    text: "Ikaw ba ay may kaalaman sa ating kasaysayan?",
                    fontStyle: FontStyle.italic,
                    fontsize: Fontsize.mobileH3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: _onStart,
                    child: const PtSerif(
                      text: "Start",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontsize: Fontsize.mobileH3,
                      fontcolor: MyColors.parchment,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
