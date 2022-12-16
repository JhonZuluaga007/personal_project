
import 'package:flutter/material.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/home/navigationBar/floating_nav_bar.dart';
import 'package:personal_project/home/navigationBar/floating_nav_bar_item.dart';
import 'package:personal_project/home/page/FAQS_page.dart';
import 'package:personal_project/home/page/covid_test_page.dart';
import 'package:personal_project/home/page/home_page.dart';
import 'package:personal_project/home/page/my_users_page.dart';
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
    final wColor = ThemesIdx20();
    final width = MediaQuery.of(context).size.width;

    Map<String, Widget> personHomePageTabs = {
      'HomePage': const HomePage(),
      'covid-19Test': const CovidTestPage(),
      'my_users': const MyUserPage(),
      "FAQS_page": const FAQSPage()
    };

    Map<String, dynamic> tabs = personHomePageTabs;
    
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    final itemsPerson = [
      buttonNavbarWidget(
          currentIndex, 0, IconsFolderCovid.home, "Home"),
      buttonNavbarWidget(
          currentIndex, 1, IconsFolderCovid.covid_19Test, "Covid-19 Tests"),
      buttonNavbarWidget(
          currentIndex, 2, IconsFolderCovid.myUser, "My users"),
      buttonNavbarWidget(
          currentIndex, 2, IconsFolderCovid.iconFAQS, "FAQS"),
    ];
    
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: wColor.mapColors["IDWhite"],
        selectedItemColor: wColor.mapColors["500BASE"],
        unselectedItemColor: wColor.mapColors["S600"],
        selectedBackgroundColor: Colors.transparent,
        elevation: 0,
        items: itemsPerson,
        height: height *0.095,
      ),
    );
  }

  FloatingNavbarItem buttonNavbarWidget(
      int currentIndex, int index, String iconsActive, String testNavBarIcon) {
    return FloatingNavbarItem(
      title: testNavBarIcon,
        customWidget: Image.asset(
                iconsActive,
                height: 30,
                width: 30,
              ),);
  }
}
