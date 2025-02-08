import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_icons.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/Catrgroy_Card.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:evanly/modules/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_tab extends StatefulWidget {
   home_tab({super.key});

  @override
  State<home_tab> createState() => _home_tabState();
}


class _home_tabState extends State<home_tab> {

  final GlobalKey<FormState> formKey = GlobalKey <FormState>();
  List<EvantCatrory> EvantCatroryListViwe2 = [
    EvantCatrory(evantCategoryName: "BookClub", evantCategoryIcon: Icons.menu_book_rounded,
        evantCategoryImage: app_images.BookClubIamge),
    EvantCatrory(evantCategoryName: "Sports", evantCategoryIcon: Icons.directions_bike,
        evantCategoryImage: app_images.SportsImage),
    EvantCatrory(evantCategoryName: "holiday", evantCategoryIcon: Icons.view_comfortable,
        evantCategoryImage: app_images.HolidayImage)
  ];
  int seletTap = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<settings_Provider>(context);
    var local = AppLocalizations.of(context)!;
    return Form(
      key:formKey ,
      child: Column(
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
                length: EvantCatroryListViwe2.length,
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
                        GestureDetector(
                          onTap: () {
                            if(provider.isDark()){
                              provider.setNewTheme(ThemeMode.light);
                            }else{
                              provider.setNewTheme(ThemeMode.dark);
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.all(12.0),
                            child: ImageIcon(AssetImage(icons_app.SunIcon,), color: app_color.appColorsWhite,),
                          ),
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
                       Column(
                        children: [
                          TabBar(
                            onTap: (index) {
                              setState(() {
                                seletTap = index; // تحديث التاب المختار
                              });
                            },
                            indicatorColor: Colors.transparent, // إخفاء المؤشر الأساسي
                            tabs: EvantCatroryListViwe2.asMap().entries.map((entry) {
                              int index = entry.key;
                              var category = entry.value;
                              return Tab(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: seletTap == index ? app_color.appColorsWhite : app_color.appColorGeneral, // لون الخلفية حسب التحديد
                                    borderRadius: BorderRadius.circular(12), // تدوير الحواف
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        category.evantCategoryIcon,
                                        color: seletTap == index ? app_color.appColorGeneral : app_color.appColorsWhite, // لون الأيقونة
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        category.evantCategoryName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: seletTap == index ? app_color.appColorGeneral : app_color.appColorsWhite // لون النص
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                    ),
                    ////////////////////
                  ],
                ),
              ),
            ),
          ),
          15.spaceVertcial,
          StreamBuilder <QuerySnapshot<EventDataModel>>
          (
            stream: firebasefunction().RealStreemDats(
              EvantCatroryListViwe2[seletTap].evantCategoryName,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Some thing went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<EventDataModel> evantDataList = snapshot.data!.docs.map((e) {
                return e.data();
              }
              ,).toList();
              return evantDataList.isEmpty
                  ? Center(child: Text("No Events Available")) // ✅ معالجة حالة عدم وجود بيانات
                  : Expanded( // ✅ حل مشكلة الـ layout عبر تغليف ListView بـ Expanded
                child: ListView.separated(
                  itemBuilder: (context, index) => CatrgroyCard(model: evantDataList[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: evantDataList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
