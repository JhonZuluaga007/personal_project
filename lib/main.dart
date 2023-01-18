import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_project/common_ui/common_pages/splash_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/page/instructions_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/page/t_questions_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/page/start_counter_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/page/upload_final_step_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/page/upload_result_page.dart';
import 'package:personal_project/features/auth/ui/pages/login_page.dart';
import 'package:personal_project/features/auth/ui/pages/reset_password_page.dart';
import 'package:personal_project/features/auth/ui/pages/reset_password_page_info_1.dart';
import 'package:personal_project/features/home/page/edit_profile/my_users_page.dart';
import 'package:personal_project/features/home/page/tests_pages/antigen_pages/antigen_register_info_page.dart';
import 'package:personal_project/features/home/page/tests_pages/pcr_pages/pcr_test_register_page.dart';
import 'package:personal_project/features/medical_history/presentation/pages/medical_history_page.dart';
import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';
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
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => NavigationBarBloc())],
        child: MaterialApp(
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
          initialRoute: "medicalHistory",
          routes: {
            "splash": (_) => const SplashScreenPage(),
            "onboarding": (_) => const IntroOnboardingPage(),
            "home": (_) => const HomePage(),
            "navBar": (_) => const NavBarPage(),
            "login": (_) => const LoginPage(),
            "resetInfo": (_) => const ResetPasswordPageInfo(),
            "reset": (_) => const ResetPasswordPage(),
            "selfTestQuestions": (_) => TQuestionsPage(),
            "instructionPage": (_) => const InstructionsPage(),
            "startCounter": (_) => const StartCounterPage(timerValue: 10),
            "uploadResult": (_) => const UploadResultPage(),
            "uploadFinalResult": (_) => const UploadFinalResultPage(),
            "pcrInfo": (_) => const PcrRegisterPage(),
            "antigenInfo": (_) => const AntigenRegisterInfoPage(),
            "medicalHistory": (_) => const MedicalHistoryPage(),
            "profile": (_) => const MyUserPage(),
          },
        ));
  }
}
