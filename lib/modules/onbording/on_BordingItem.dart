import 'dart:io';

import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/modules/onbording/on_bording_model.dart';
import 'package:flutter/material.dart';

class on_Bordingitem extends StatelessWidget {
  final on_bordingMpdel on_bordingModel;
  on_Bordingitem({super.key, required this.on_bordingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(on_bordingModel.ImagePath),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(right: 180),
            child: Text(
              on_bordingModel.title,
              style: TextStyle(
                color: app_color.appColorGeneral,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              on_bordingModel.dcs ?? "Nothing",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: app_color.appColorsecound,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
