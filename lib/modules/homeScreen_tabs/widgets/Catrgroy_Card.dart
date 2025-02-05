import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CatrgroyCard extends StatelessWidget {
  CatrgroyCard({super.key, required this.model});
  final EventDataModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(model.EnantIamge),
            fit: BoxFit.cover, // ✅ حل مشكلة عدم تعبئة الصورة بالكامل
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ محاذاة النصوص بشكل صحيح
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20), // ✅ تغيير `right: 290` الذي قد يسبب مشكلة
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: app_color.appColorsWhite.withOpacity(0.8), // ✅ جعل الخلفية شفافة قليلاً
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // ✅ محاذاة النصوص لليسار
                  children: [
                    Text(
                      model.EvantCategray,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: app_color.appColorGeneral,
                      ),
                    ),
                    Text(
                      DateFormat("dd MMM").format(model.EvantDate),
                      style: TextStyle(
                        fontSize: 15,
                        color: app_color.appColorGeneral,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(), // ✅ جعل العنصر التالي في الأسفل دائمًا
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10), // ✅ تحسين المسافات
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: app_color.appColorsWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded( // ✅ تجنب تجاوز النص للحجم المحدد
                      child: Text(
                        model.Evanttitle,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis, // ✅ إذا كان النص طويلًا يتم اقتصاصه
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          model.isfavorute = !model.isfavorute;
                          firebasefunction().updetEvent(model.EvantId, {"isfavorute": model.isfavorute});
                        },
                        child: model.isfavorute ?
                        Icon(Icons.favorite) : Icon(Icons.favorite_border),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

