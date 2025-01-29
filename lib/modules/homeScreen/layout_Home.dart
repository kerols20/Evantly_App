import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/create_Evant/create_Evant.dart';
import 'package:evanly/modules/homeScreen_tabs/home_tab.dart';
import 'package:evanly/modules/homeScreen/widget/list_%20bulider.dart';
import 'package:evanly/modules/homeScreen_tabs/home_tab.dart';
import 'package:flutter/material.dart';

class LayoutHome extends StatefulWidget {
   LayoutHome({super.key});

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  int Selectedindex = 0;
  List<Widget> tabs = [
    home_tab(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    var meda = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              width: 5,
              color: app_color.appColorsWhite
            ) ,
          ),
          backgroundColor: app_color.appColorGeneral,
          onPressed: () {
            context.navigateTo(create_Evant());
        },
          child: Icon(Icons.add,
          color: app_color.appColorsWhite,),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onButtomVavBar,
          currentIndex: Selectedindex,
          selectedItemColor: app_color.appColorsWhite, // لون العنصر النشط
          unselectedItemColor: app_color.appColorsWhite, // لون العناصر غير النشطة
          backgroundColor: app_color.appColorGeneral,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled), // أيقونة خاصة عند التفعيل
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              activeIcon: Icon(Icons.location_on), // أيقونة خاصة عند التفعيل
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite), // أيقونة خاصة عند التفعيل
              label: "love",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded),
              activeIcon: Icon(Icons.perm_identity), // أيقونة خاصة عند التفعيل
              label: "profile",
            ),
          ],
        ),
        body: tabs[Selectedindex],
      ),
    );
  }
   _onButtomVavBar(int index) {
    setState(() {
      Selectedindex = index;
    });
  }

}
