import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class button_nav_ba extends StatelessWidget {
  const button_nav_ba({super.key,required this.icon, required this.isSelected, required this.textString});
  final String textString;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: app_color.appColorsWhite
        ),
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? app_color.appColorsWhite : Colors.transparent ,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( icon , color: isSelected ? app_color.appColorGeneral : app_color.appColorsWhite,),
          5.spaceHorzintail,
          Text(textString , style: TextStyle(
              color: isSelected ? app_color.appColorGeneral : app_color.appColorsWhite,
          ),)
        ],
      ),
    );
  }
}
 class button_nav_ba2 extends StatelessWidget {
   button_nav_ba2({super.key,required this.icon, required this.isSelected, required this.textString});
  final String textString;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
            color: app_color.appColorGeneral
        ),
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? app_color.appColorGeneral : Colors.transparent ,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( icon , color: isSelected ? app_color.appColorsWhite : app_color.appColorGeneral,),
          5.spaceHorzintail,
          Text(textString , style: TextStyle(
            color: isSelected ? app_color.appColorsWhite : app_color.appColorGeneral,
          ),)
        ],
      ),
    );
  }
}
class button_nav_ba3 extends StatelessWidget {
  const button_nav_ba3({super.key,required this.icon, required this.isSelected, required this.textString});
  final String textString;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
            color: app_color.appColorGeneral
        ),
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? app_color.appColorGeneral : Colors.transparent ,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( icon , color: isSelected ? app_color.appColorsWhite : app_color.appColorGeneral,),
          5.spaceHorzintail,
          Text(textString , style: TextStyle(
            color: isSelected ? app_color.appColorsWhite : app_color.appColorGeneral,
          ),)
        ],
      ),
    );
  }
}