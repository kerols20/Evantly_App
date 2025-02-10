import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/create_Evant/create_Evant.dart';
import 'package:evanly/modules/homeScreen_tabs/home_tab.dart';
import 'package:evanly/modules/homeScreen_tabs/likes_tab.dart';
import 'package:evanly/modules/map_tab.dart';
import 'package:evanly/modules/profile_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LayoutHome extends StatefulWidget {
  LayoutHome({super.key});

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  int Selectedindex = 0;

  List<Widget> tabs = [
    HomeTab(),
    favorite_tab(),
    maps_tab(),
    Profile_tab(),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              width: 5,
              color: app_color.appColorsWhite,
            ),
          ),
          backgroundColor: app_color.appColorGeneral,
          onPressed: () {
            context.navigateTo(Home());
          },
          child: Icon(
            Icons.add,
            color: app_color.appColorsWhite,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onButtomVavBar,
          currentIndex: Selectedindex,
          selectedItemColor: app_color.appColorsWhite,
          unselectedItemColor: app_color.appColorsWhite,
          backgroundColor: app_color.appColorGeneral,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: local.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: local.favorite, // تصحيح التسمية
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              activeIcon: Icon(Icons.map),
              label: local.map, // تصحيح التسمية
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded),
              activeIcon: Icon(Icons.perm_identity),
              label: local.profile,
            ),
          ],
        ),
        body: tabs[Selectedindex],
      ),
    );
  }

  _onButtomVavBar(int index) {
    if (index == 2) return; // تجاهل الزر الأوسط
    setState(() {
      Selectedindex = index > 2 ? index - 1 : index; // تعديل الفهرس
    });
  }
}
