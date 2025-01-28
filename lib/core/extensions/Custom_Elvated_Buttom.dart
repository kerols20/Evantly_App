import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomElvatedButtom extends StatelessWidget {
   CustomElvatedButtom({super.key, required this.text, required this.borderRudis});
final String text;
final double borderRudis;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
    }, child: Text(text, style: TextStyle(
      color: app_color.appColorsecound,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    ),
      style: ElevatedButton.styleFrom(
        backgroundColor: app_color.appColorsWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRudis),
        )
      ),
    );
  }
}
