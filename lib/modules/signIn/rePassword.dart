import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:flutter/material.dart';

class rePassword extends StatelessWidget {
   rePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(app_images.IamgeFive),
          OutlinedButton(onPressed: () {
            //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          }, child: Text("Reset Password", style: TextStyle(
            fontSize: 20,
            color: app_color.appColorsWhite,
            fontWeight: FontWeight.w700
          ),),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(390, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: app_color.appColorGeneral
            ),
          )
        ],
      ),
    );
  }
}
