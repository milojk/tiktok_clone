import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/generated/l10n.dart';

import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
//import 'package:tiktok_clone/features/main_navigation/main_naviation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    //S.load(const Locale('en'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone ',
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ko'),
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        //textTheme: GoogleFonts.ralewayTextTheme(),
        textTheme: Typography.blackMountainView,
        primaryColor: const Color(0xffe9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435A),
        ),
        splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black26,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black26,
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey.shade500,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        iconTheme: IconThemeData(
          color: Colors.grey.shade800,
        ),

        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe9435A)),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        //textTheme: GoogleFonts.ralewayTextTheme(),
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xffe9435A),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: const TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          //surfaceTintColor: Colors.grey.shade800,
          color: Colors.grey.shade900,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435A),
        ),

        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,

        iconTheme: IconThemeData(
          color: Colors.grey.shade500,
        ),
      ),

      //home: const MainNaviationScreen(),
      home: const SignUpScreen(),
    );
  }
}
