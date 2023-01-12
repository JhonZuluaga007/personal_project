import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/app_localizations.dart';
import 'package:personal_project/common_ui/common_widgets/drawer_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/page/edit_profile/edit_profile_bottom_page.dart';
import 'package:personal_project/features/home/page/faqs_page.dart';
import 'package:personal_project/features/home/page/edit_profile/my_users_page.dart';
import 'package:personal_project/features/home/page/register_pcr_test_page.dart';
import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';
import 'package:personal_project/navigationBar/floating_nav_bar_item.dart';
import 'package:personal_project/features/home/page/tests_pages/register_antigen_test_page.dart';
import 'package:personal_project/features/home/page/home_page.dart';
import 'package:personal_project/features/home/page/history_page.dart';
import 'package:personal_project/icons/icons.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key, this.initialPage}) : super(key: key);

  final String? initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'coinpurse_home_no_funds';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final wColor = ThemesIdx20();

    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);

    final List<Map<String, dynamic>> pageDetails = [
      {'pageName': const HomePage(), 'title': 'Home'},
      {'pageName': const HistoryPage(), 'title': 'Antigen'},
      {'pageName': const RegisterTestPage(), 'title': 'User'},
      {'pageName': const EditUserFromBottomPage(), 'title': 'UserEdit'},
      {'pageName': const FAQSPage(), 'title': 'FAQs'},
    ];

    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: wColor.mapColors["IDWhite"],
              shadowColor: wColor.mapColors["IDWhite"],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: Image.asset("assets/icons/idx_Icon.png"),
              centerTitle: true,
              actions: [
                SizedBox(
                  width: width * 0.30,
                ),
              ],
            ),
            body: pageDetails[state.indexNavigation]['pageName'],
            extendBody: true,
            drawer: const DrawerWidget(),
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: true,
              backgroundColor: wColor.mapColors["IDWhite"],
              selectedItemColor: wColor.mapColors["500BASE"],
              unselectedItemColor: wColor.mapColors["S600"],
              currentIndex: state.indexNavigation,
              onTap: (index) {
                setState(() {
                  state.indexNavigation = index;
                  navigationBloc.add(PageChanged(
                    indexNavigation: index,
                  ));
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsFolderCovid.home,
                      color: wColor.mapColors['IDPink'],
                    ),
                    label:
                        AppLocalizations.of(context)!.translate("nav_bar_01")),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsFolderCovid.covid_19Test,
                      color: wColor.mapColors['IDPink'],
                    ),
                    label:
                        AppLocalizations.of(context)!.translate("nav_bar_02")),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsFolderCovid.covid_19Test,
                      color: wColor.mapColors['IDPink'],
                    ),
                    label:
                        AppLocalizations.of(context)!.translate("nav_bar_03")),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsFolderCovid.myUser,
                      color: wColor.mapColors['IDPink'],
                    ),
                    label:
                        AppLocalizations.of(context)!.translate("nav_bar_04")),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsFolderCovid.iconFAQS,
                      color: wColor.mapColors['IDPink'],
                    ),
                    label:
                        AppLocalizations.of(context)!.translate("nav_bar_05"))
              ],
            ));
      },
    );
  }

  FloatingNavbarItem buttonNavbarWidget(
      int currentIndex, int index, String iconsActive, String testNavBarIcon) {
    return FloatingNavbarItem(
      title: AppLocalizations.of(context)!.translate(testNavBarIcon),
      customWidget: Image.asset(
        iconsActive,
        height: 30,
        width: 30,
      ),
    );
  }
}
