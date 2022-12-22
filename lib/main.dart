// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_project/common_ui/common_pages/splash_page.dart';
import 'package:personal_project/features/auth/ui/pages/login_page.dart';
import 'package:personal_project/features/auth/ui/pages/reset_password_page.dart';
import 'package:personal_project/features/auth/ui/pages/reset_password_page_info_1.dart';
import 'package:personal_project/navigationBar/navigation_bar_widget.dart';
import 'package:personal_project/features/home/page/home_page.dart';
import 'package:personal_project/onboarding/pages/intro_onboarding_page.dart';

import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idx20',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale!.languageCode.toString() != const Locale('es') ||
            locale.languageCode.toString() != const Locale('en')) {
          return const Locale('en');
        }
        return Locale(locale.languageCode.toString());
      },
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: "splash",
      routes: {
        "splash": (_) => const SplashScreenPage(),
        "onboarding": (_) => const IntroOnboardingPage(),
        "home": (_) => const HomePage(),
        "navBar": (_) => const NavBarPage(),
        "login": (_) => const LoginPage(),
        "resetInfo": (_) => const ResetPasswordPageInfo(),
        "reset": (_) => const ResetPasswordPage(),
      },
    );
  }
}
