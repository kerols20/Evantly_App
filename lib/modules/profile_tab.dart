import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_icons.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile_tab extends StatelessWidget {
   Profile_tab({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<settings_Provider>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: app_color.appColorGeneral,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
            ),
            height: 180,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Image.asset("assets/images/Rectangle 76.png"),
                    height: 124,
                    width: 124,
                    decoration: BoxDecoration(
                      color: app_color.appColorsWhite,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(1000),

                      ),
                    ),
                    ),
                ),
                10.spaceHorzintail,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kerolos Adel" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: app_color.appColorsWhite,
                      fontSize: 20,
                    ),),
                    Text("kokoqaw@gmail.com" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: app_color.appColorsWhite,
                      fontSize: 18,
                    ),)
                  ],
                )
              ]
            ) ,
          ),
          30.spaceVertcial,
          Text("Language", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: app_color.appColorsecound,
            fontSize: 20,
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdown<String>(
              hintText: provider.Current_Languge == "en" ? "English" : "عربي",
              items: Provider.of<settings_Provider>(context).allLanguages,
              onChanged: ( value) {
                if(value == "English") provider.setNewLanguge("en");
                if(value != "English") provider.setNewLanguge("ar");
              },
              decoration: CustomDropdownDecoration(
                closedBorder: Border.all(color: app_color.appColorGeneral),
                closedSuffixIcon: Icon(Icons.arrow_drop_down, color: app_color.appColorGeneral, size: 28,),
              ),
            ),
          ),
          15.spaceVertcial,
          Text("theme mode", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: app_color.appColorsecound,
            fontSize: 20,
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropdown<String>(
              hintText: provider.isDark() ? "Dark" : "Light" ,
              items: Provider.of<settings_Provider>(context).themeMode1,
              onChanged: ( value) {
                if(value == "Dark") provider.setNewTheme(ThemeMode.dark);
                if(value == "Light") provider.setNewTheme(ThemeMode.light);
              },
              decoration: CustomDropdownDecoration(
                closedBorder: Border.all(color: app_color.appColorGeneral),
                closedSuffixIcon: Icon(Icons.arrow_drop_down, color: app_color.appColorGeneral, size: 28,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
