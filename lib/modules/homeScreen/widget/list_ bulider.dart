import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class List_bulider extends StatelessWidget {
   List_bulider({super.key, required this.icon, required this.Text2});
   final Icon icon;
   final Text Text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: app_color.appColorsWhite,
        borderRadius: BorderRadius.circular(25)
      ),
      width: 80,
      height: 15,
      child: Row(
        children: [
          icon,
          Text2,
        ],
      ),
    );
  }
}
