import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/Catrgroy_Card.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:flutter/material.dart';

class favorite_tab extends StatefulWidget {
  const favorite_tab({super.key});

  @override
  State<favorite_tab> createState() => _favorite_tabState();
}

class _favorite_tabState extends State<favorite_tab> {
  List<EvantCatrory> EvantCatroryListViwe3 = [
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomFormField(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: app_color.appColorGeneral, width: 2),
            ),
            prefixIcon: Icons.search,
            hintText: "Search",
          ),10.spaceVertcial,
          StreamBuilder <QuerySnapshot<EventDataModel>>
            (
            stream: firebasefunction().favoriteFireStore(),
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
