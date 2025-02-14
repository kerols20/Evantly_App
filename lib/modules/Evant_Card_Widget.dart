import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constant/app_color.dart';

class CatrgroyCard extends StatefulWidget {
  CatrgroyCard({super.key, required this.model});
  final EventDataModel model;

  @override
  State<CatrgroyCard> createState() => _CatrgroyCardState();
}

class _CatrgroyCardState extends State<CatrgroyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.model.eventImage),
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
                      widget.model.eventCategory,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: app_color.appColorGeneral,
                      ),
                    ),
                    Text(
                      DateFormat("dd MMM").format(widget.model.eventDate),
                      style: TextStyle(
                        fontSize: 15,
                        color: app_color.appColorGeneral,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(), //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10), //
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: app_color.appColorsWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded( //
                      child: Text(
                        widget.model.eventTitle,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool newFavoriteStatus = !widget.model.isFavorite;
                        setState(() {
                          widget.model.isFavorite = newFavoriteStatus;
                        });

                        try {
                          await firebasefunction.updateEvent(
                            widget.model.eventID,
                            {"isFavorite": newFavoriteStatus},
                          );
                        } catch (error) {
                          print("خطأ أثناء تحديث المفضلة: $error");

                          setState(() {
                            widget.model.isFavorite = !newFavoriteStatus;
                          });
                        }
                      },
                      child: Icon(
                        widget.model.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: widget.model.isFavorite ? app_color.appColorGeneral : Colors.white,
                      ),
                    ),


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
