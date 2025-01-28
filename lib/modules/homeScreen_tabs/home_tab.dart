import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_icons.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/Catrgroy_Card.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:flutter/material.dart';

class home_tab extends StatelessWidget {
   home_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: app_color.appColorGeneral,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25) ,
              bottomLeft: Radius.circular(25) ,
            )
          ),
          height: 180,
          width: double.infinity,
          child: SafeArea(
            child: DefaultTabController(
              length: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 15),
                                child: Text("Welcome Back ✨", style: TextStyle(
                                  fontSize: 16,
                                  color: app_color.appColorsWhite,
                                ),),
                              ),
                              5.spaceVertcial,
                              Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Text("Kerolos Adel", style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: app_color.appColorsWhite,
                                ),),
                              ),
                            ],
                          ),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.all(12.0),
                        child: ImageIcon(AssetImage(icons_app.SunIcon,), color: app_color.appColorsWhite,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomElvatedButtom(text: 'EN',
                          borderRudis: 25,
                        ),
                      )
                    ],
                  ),
                  5.spaceVertcial,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.location_on_outlined, color: app_color.appColorsWhite,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Cairo, Egypt", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: app_color.appColorsWhite,
                        ),),
                      ),
                    ],
                  ),
                  Expanded(child: TabBar(
                    tabAlignment: TabAlignment.start,
                    // to start from start line
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                      indicatorColor: Colors.transparent,
                      tabs: [
                    Tab(
                      child:button_nav_ba(icon: Icons.add, isSelected: true, textString: "Home") ,
                    ),
                        Tab(
                          child:button_nav_ba(icon: Icons.add, isSelected: false, textString: "Home") ,
                        ),
                        Tab(
                          child:button_nav_ba(icon: Icons.add, isSelected: false, textString: "Home") ,
                        ),
                        Tab(
                          child:button_nav_ba(icon: Icons.add, isSelected: false, textString: "Home") ,
                        ),
                        Tab(
                          child:button_nav_ba(icon: Icons.add, isSelected: false, textString: "Home") ,
                        ),
                  ]
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
        15.spaceVertcial,
        Expanded(child: ListView.separated(itemBuilder: (context, index) {
          return CatrgroyCard();
        }, separatorBuilder: (context, index) {
          return 15.spaceVertcial;
        }, itemCount: 10))

      ],
    );
  }
}
