import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:flutter/material.dart';

class RePassword extends StatelessWidget {
  RePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaQuery.size.height * 0.05),
              Image.asset(app_images.IamgeFive, height: mediaQuery.size.height * 0.3),
              SizedBox(height: mediaQuery.size.height * 0.05),
              OutlinedButton(
                onPressed: () {
                  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: mediaQuery.size.width * 0.05,
                    color: app_color.appColorsWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(mediaQuery.size.width * 0.9, mediaQuery.size.height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: app_color.appColorGeneral,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
