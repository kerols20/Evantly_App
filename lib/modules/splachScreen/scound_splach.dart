import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/modules/onbording/on_Bording_screens.dart';
import 'package:flutter/material.dart';

class scound_splach extends StatelessWidget {
  scound_splach({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: media.height * 0.03),
              Center(
                child: Image.asset(
                  app_images.ConstantLogoEvanly,
                  height: media.height * 0.09,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Expanded(
                child: Image.asset(
                  app_images.ImageOneOnbording,
                  width: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Text(
                "Personalize Your Experience",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: app_color.appColorGeneral,
                  fontWeight: FontWeight.bold,
                  fontSize: media.width * 0.06,
                ),
              ),
              SizedBox(height: media.height * 0.01),
              Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: app_color.appColorsecound,
                  fontWeight: FontWeight.bold,
                  fontSize: media.width * 0.04,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Text(
                "Language",
                style: TextStyle(
                  fontSize: media.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: app_color.appColorGeneral,
                ),
              ),
              SizedBox(height: media.height * 0.01),
              Text(
                "Theme",
                style: TextStyle(
                  fontSize: media.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: app_color.appColorGeneral,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => on_Bording_screens(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  minimumSize: Size(media.width * 0.6, media.height * 0.07),
                  backgroundColor: app_color.appColorGeneral,
                ),
                child: Text(
                  "Let’s Start",
                  style: TextStyle(
                    color: app_color.appColorsWhite,
                    fontSize: media.width * 0.045,
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
