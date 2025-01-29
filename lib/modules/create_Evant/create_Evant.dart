import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:flutter/material.dart';

class create_Evant extends StatelessWidget {
   create_Evant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
               Padding(
                 padding:  EdgeInsets.only(right: 130),
                 child: Text("Create Evant",style: TextStyle(
                  fontSize: 22,
                   color: app_color.appColorGeneral
                 ),),
               ),
            ],
          )

        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(app_images.HolidayImage),
            ),
            5.spaceVertcial,
            Row(
              children: [
                Expanded(child: TabBar(
                tabAlignment: TabAlignment.start,
                // to start from start line
                dividerColor: Colors.transparent,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: [
                Tab(
                child:button_nav_ba2(icon: Icons.add, isSelected: true, textString: "Home") ,
                ),
                Tab(
                child:button_nav_ba2(icon: Icons.add, isSelected: false, textString: "Home") ,
                ),
                Tab(
                child:button_nav_ba2(icon: Icons.add, isSelected: false, textString: "Home") ,
                ),
                Tab(
                child:button_nav_ba2(icon: Icons.add, isSelected: false, textString: "Home") ,
                ),
                Tab(
                child:button_nav_ba2(icon: Icons.add, isSelected: false, textString: "Home") ,
                ),
                ]
                ),
                ),
              ],
            ),
            10.spaceVertcial,
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 330),
                  child: Text("Title", style: TextStyle(
                    color: app_color.appColorsecound,
                    fontSize: 18,
                  )
                  ),
                ),
                CustomFormField(
                  labelText: 'We Are Going To Play Football', hintText: '', prefixIcon: Icons.edit_note,
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 290),
                  child: Text("Description", style: TextStyle(
                    color: app_color.appColorsecound,
                    fontSize: 18,
                  )
                  ),
                ),
                CustomFormField(
                  labelText: 'Evant Description', hintText: '',
                ),
                5.spaceVertcial,
                Row(
                  children: [
                    Icon(Icons.calendar_month, color: app_color.appColorsecound,
                    ),
                    8.spaceHorzintail,
                    Text("Event Date", style: TextStyle(
                      color: app_color.appColorsecound,
                      fontSize: 18,
                    )
                    ),
                    170.spaceHorzintail,
                    GestureDetector(
                      onTap: () {
                        ///xxxxxxxxxxxxxxxxxxxxxxxxx////////////
                      },
                      child: Text('choose Date', style: TextStyle(
                        color: app_color.appColorGeneral,
                        fontSize: 18,
                      )
                      ),
                    ),
                  ],
                ),
                10.spaceVertcial,
                Row(
                  children: [
                    Icon(Icons.access_time_filled, color: app_color.appColorsecound,
                    ),
                    8.spaceHorzintail,
                    Text("Event time", style: TextStyle(
                      color: app_color.appColorsecound,
                      fontSize: 18,
                    )
                    ),
                    170.spaceHorzintail,
                    GestureDetector(
                      onTap: () {
                        ///xxxxxxxxxxxxxxxxxxxxxxxxx////////////
                      },
                      child: Text('choose time', style: TextStyle(
                        color: app_color.appColorGeneral,
                        fontSize: 18,
                      )
                      ),
                    ),
                  ],
                ),
                5.spaceVertcial,
                Padding(
                  padding: const EdgeInsets.only(right: 330),
                  child: Text("loction", style: TextStyle(
                    color: app_color.appColorsecound,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
                  ),
                ),
                5.spaceVertcial,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )),
                      minimumSize: WidgetStatePropertyAll(Size(40,70)),
                      side:WidgetStateProperty.all(BorderSide(
                        color: app_color.appColorGeneral,
                        width: 1.5
                      )) ,
                    ),
                    child:Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: app_color.appColorGeneral, // لون الخلفية
                          borderRadius: BorderRadius.circular(10), // زوايا دائرية اختيارية
                        ),
                        padding: EdgeInsets.all(12), // زيادة المساحة داخل الـ Container
                        child: Icon(
                          Icons.location_on,
                          color: app_color.appColorsWhite, // لون الأيقونة
                          size: 30, // تكبير حجم الأيقونة إذا لزم الأمر
                        ),
                      ),
                      10.spaceHorzintail,
                      Text(
                        'Cairo, Egypt',
                        style: TextStyle(
                          color: app_color.appColorGeneral,
                          fontSize: 18,
                        ),
                      ),
                      160.spaceHorzintail,
                      Icon(Icons.arrow_forward_ios_outlined, color: app_color.appColorGeneral,)
                    ],
                  ),
                  ),
                ),
                5.spaceVertcial,
                OutlinedButton(onPressed: () {
                }, child: Text("Creata Event", style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.w700,
                    color: app_color.appColorsWhite
                ),),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(390, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: app_color.appColorGeneral
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
