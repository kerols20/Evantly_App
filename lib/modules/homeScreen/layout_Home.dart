import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/modules/homeScreen/widget/list_%20bulider.dart';
import 'package:flutter/material.dart';

class LayoutHome extends StatefulWidget {
   LayoutHome({super.key});

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  int Selectedindex = 0;
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
            ///////////////xxxxxxxxxxxx//////////////////
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

        body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                 color: app_color.appColorGeneral,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)
                )
              ),
              width: 50,
              height: 150,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 5, left: 8),
                         child: Text("Welcome Back ✨", style: TextStyle(
                           color: app_color.appColorsWhite,
                           fontSize: 14,
                         ),),
                       ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(bottom: 5, left: 8),
                             child: Text("Kerolos adel", style: TextStyle(
                               color: app_color.appColorsWhite,
                               fontSize: 22,
                             ),),
                           ),
                           SizedBox(width: 180,),
                           Padding(
                             padding: const EdgeInsets.only(right: 10, ),
                             child: Icon(Icons.sunny, color: app_color.appColorsWhite,),
                           ),
                           Container(
                             width: 50,
                             height: 50,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: app_color.appColorsWhite
                             ),
                             child: Padding(
                               padding: const EdgeInsets.only(top: 12),
                               child: Text("EN",textAlign: TextAlign.center ,style: TextStyle(
                                 color: app_color.appColorGeneral,
                                 fontSize: 18,
                               ),),
                             ),
                           ),
                         ],
                       ),
                   Row(
                     children: [
                       Icon(Icons.location_on_outlined,  color: app_color.appColorsWhite,),
                       Text("Cairo , Egypt", style: TextStyle(
                         color: app_color.appColorsWhite,
                         fontSize: 15,
                         fontWeight: FontWeight.w700
                       ),)
                     ],
                   ),
                   Expanded(
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: 3,
                       itemBuilder: (context, index) {
                        return List_bulider(
                         Text2: Text("ALL"),
                         icon: Icon(Icons.location_on_outlined,),
                       );
                     },),
                   )
                 ],
               ),
            )
          ],
        ),
      ),
    );
  }
   _onButtomVavBar(int index) {
    setState(() {
      Selectedindex = index;
    });
  }

}
