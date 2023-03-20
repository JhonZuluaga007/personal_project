import 'package:Tellme/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:flutter/material.dart';
import 'package:Tellme/icons/icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/card_scan_home.dart';
import '../../../app_localizations.dart';
import '../../../config/theme/theme.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';
import '../../auth/presentation/bloc/helper_tools_bloc.dart';
import '../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../common_ui/common_widgets/text/text_widget.dart';
import '../../pcr/presentation/pages/pcr_test_register_page.dart';
import '../../antigen/presentation/ui/pages/antigen_register_info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(GetUser());
    BlocProvider.of<HelperToolsBloc>(context).add(GetTestTools());
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);

    return MyAppScaffold(
      children: [
        SizedBox(height: height * 0.018),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.018),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: AppLocalizations.of(context)!.translate("home_hi"),
                  style: TextStyle(
                      letterSpacing: -0.02,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: wColor.mapColors["S800"]),
                ),
                TextSpan(
                  text: authBloc.state.name,
                  style: TextStyle(
                      letterSpacing: -0.02,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: wColor.mapColors["S800"]),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.translate("home_welcome"),
                  style: TextStyle(
                      letterSpacing: -0.02,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: wColor.mapColors["S800"]),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.018),
          child: TextWidget(
            text: "home_title_card",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: wColor.mapColors["S800"]),
          ),
        ),
        SizedBox(height: height * 0.02),
        CardScanHome(
          imageIcon: IconsFolderCovid.scanKitLabel,
          textDescription: "home_description_card_scan",
          textTitle: "home_title_card_scan",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AntigenRegisterInfoPage(
                          isHomeNavigation: true,
                        )));
          },
        ),
        SizedBox(height: height * 0.021),
        CardScanHome(
          imageIcon: IconsFolderCovid.covid19Self,
          textDescription: "home_description_card_scan",
          textTitle: "home_title_card_covid_19",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PcrRegisterPage(
                          isHomeNavigation: true,
                        )));
          },
        ),
        SizedBox(height: height * 0.021),
        CardScanHome(
          imageIcon: IconsFolderCovid.testStatusResult,
          textDescription: "home_description_card_scan",
          textTitle: "home_title_card_test_status",
          onTap: () {
            navigationBloc.add(PageChanged(indexNavigation: 1));
            Navigator.pushNamed(context, 'navBar');
          },
        ),
      ],
    );
  }
}
