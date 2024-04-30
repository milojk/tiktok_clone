import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_naviation_screen.dart';
//import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone ',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435A),
        ),
        splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black26,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black26,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe9435A)),
        useMaterial3: true,
      ),
      home: const MainNaviationScreen(),
    );
  }
}
