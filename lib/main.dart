import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_project/common_ui/common_pages/splash_page.dart';
import 'package:personal_project/features/antigen/presentation/bloc/antigen_test_bloc.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';
import 'package:personal_project/features/auth/bloc/helper_tools_bloc.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/page/instructions_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/page/t_questions_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/page/start_counter_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/page/upload_final_step_page.dart';
import 'package:personal_project/features/home/page/covid_19_test/presentation/page/upload_result_page.dart';
import 'package:personal_project/features/auth/presentation/pages/login_page.dart';
import 'package:personal_project/features/auth/presentation/pages/reset_password_page.dart';
import 'package:personal_project/features/auth/presentation/pages/reset_password_page_info_1.dart';
import 'package:personal_project/features/home/page/edit_profile/my_users_page.dart';
import 'package:personal_project/features/antigen/presentation/pages/antigen_pages/antigen_register_info_page.dart';
import 'package:personal_project/features/pcr/presentation/pages/pcr_test_register_page.dart';
import 'package:personal_project/features/medical_history/presentation/bloc/medical_history_bloc.dart';
import 'package:personal_project/features/medical_history/presentation/pages/medical_history_page.dart';
import 'package:personal_project/features/test_history/bloc/test_history_bloc.dart';
import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';
import 'package:personal_project/navigationBar/navigation_bar_widget.dart';
import 'package:personal_project/features/home/page/home_page.dart';
import 'package:personal_project/onboarding/pages/intro_onboarding_page.dart';

import 'app_localizations.dart';
import 'config/helpers/injector/injector.dart';

void main() {
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationBarBloc()),
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => MedicalHistoryBloc()),
          BlocProvider(create: (_) => TestHistoryBloc()),
          BlocProvider(create: (_) => AntigenTestBloc()),
          BlocProvider(create: (_) => HelperToolsBloc()),
        ],
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
          initialRoute: "splash",
          routes: {
            "splash": (_) => const SplashScreenPage(),
            "onboarding": (_) => const IntroOnboardingPage(),
            "home": (_) => const HomePage(),
            "navBar": (_) => const NavBarPage(),
            "login": (_) => const LoginPage(),
            "resetInfo": (_) => const ResetPasswordPageInfo(),
            "reset": (_) => const ResetPasswordPage(),
            "selfTestQuestions": (_) => const TQuestionsPage(),
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
