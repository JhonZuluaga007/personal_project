import 'package:flutter/material.dart';
import 'package:personal_project/app_localizations.dart';
import 'package:personal_project/common_ui/common_widgets/drawer_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/page/faqs_page.dart';
import 'package:personal_project/navigationBar/floating_nav_bar.dart';
import 'package:personal_project/navigationBar/floating_nav_bar_item.dart';
import 'package:personal_project/features/home/page/register_antigen_test_page.dart';
import 'package:personal_project/features/home/page/home_page.dart';
import 'package:personal_project/features/home/page/history_page.dart';
import 'package:personal_project/icons/icons.dart';

import '../features/home/page/my_users_page.dart';

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

    Map<String, Widget> personHomePageTabs = {
      'HomePage': const HomePage(),
      'registerAntigen': const RegisterAntigenTestPage(),
      'registerPcr': const MyUserPage(),
      'history': const HistoryPage(),
      'faqsPage': const FAQSPage()
    };

    Map<String, dynamic> tabs = personHomePageTabs;

    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    final itemsPerson = [
      buttonNavbarWidget(
        currentIndex, 0, IconsFolderCovid.home, "nav_bar_01"),
      buttonNavbarWidget(
          currentIndex, 1, IconsFolderCovid.covid_19Test, "nav_bar_02"),
      buttonNavbarWidget(
          currentIndex, 2, IconsFolderCovid.myUser, "nav_bar_03"),
      buttonNavbarWidget(
          currentIndex, 3, IconsFolderCovid.iconFAQS, "nav_bar_04"),
      buttonNavbarWidget(
          currentIndex, 4, IconsFolderCovid.iconFAQS, "nav_bar_05"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: wColor.mapColors["IDWhite"],
        shadowColor: wColor.mapColors["IDWhite"],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset("assets/icons/idx_Icon.png"),
        ),
        actions: [
          SizedBox(
            width: width * 0.30,
          ),
        ],
      ),
      body: tabs[_currentPage],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: wColor.mapColors["IDWhite"],
        selectedItemColor: wColor.mapColors["500BASE"],
        unselectedItemColor: wColor.mapColors["S600"],
        selectedBackgroundColor: Colors.transparent,
        elevation: 0,
        items: itemsPerson,
        height: height * 0.095,
      ),
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
