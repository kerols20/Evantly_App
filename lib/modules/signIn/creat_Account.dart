
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:flutter/material.dart';

class CreatAccount extends StatelessWidget {
   CreatAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(app_images.splachLogo,height: mediaQuery.size.height *0.25
        ),
        CustomFormField(labelText: 'Name', hintText: 'Name',),
        SizedBox(height:10 ,),
        CustomFormField(
          isPassword: true,
          labelText: 'Email', hintText: 'Enter your Email',
        ),
        SizedBox(height:10 ,),
        CustomFormField(labelText: 'Password', hintText: 'Password', isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye,),
        SizedBox(height:10 ,),
        CustomFormField(labelText: 'RePassword', hintText: 'RePassword',isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye),
        SizedBox(height: 10,),
        OutlinedButton(onPressed: () {
          //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        }, child: Text("Creata Account", style: TextStyle(
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
    ).setCenter(),
    );
  }
}
