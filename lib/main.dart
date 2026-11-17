import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerphis_game/Pages/HomeScreen.dart';
import 'package:gerphis_game/core/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Pt_serif",
        scaffoldBackgroundColor: MyColors.parchment,
        colorScheme: const ColorScheme.light(
          primary: MyColors.ink,
          onPrimary: MyColors.parchment,
          secondary: MyColors.gold,
          onSecondary: MyColors.ink,
          surface: MyColors.parchment,
          onSurface: MyColors.ink,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.ink,
            foregroundColor: MyColors.parchment,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: MyColors.parchment, width: 2),
            ),
          ),
        ),
      ),
      home: Homescreen(),
    );
  }
}
