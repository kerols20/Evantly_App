import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/modules/onbording/on_Bording_screens.dart';
import 'package:evanly/modules/onbording/on_bording_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Meda = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(top: 30),
                child:  Image.asset(app_images.ConstantLogoEvanly,height: Meda.size.height *0.090,),
              ),
              SizedBox(height: 20,),
              Container(
                child: Image.asset(on_bordingMpdel.ListOnBording[0].ImagePath),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text("Personalize Your Experience",textAlign: TextAlign.left ,style: TextStyle(
                    color: app_color.appColorGeneral,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text("Choose your preferred theme and language to get started with a comfortable,"
                    " tailored experience that suits your style.",textAlign: TextAlign.left ,style: TextStyle(
                    color: app_color.appColorsecound,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
              ),
              SizedBox(height: 10,),
              ///xxxxxxxxxxxxxxxxxxxxxxxxxxx
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Language", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: app_color.appColorGeneral
                    ),),
                  ),
                ],
              ), /// buttoms
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Theme", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: app_color.appColorGeneral
                    ),),
                  ),
                ],
              ),
              //xxxxxxxxxxxxxxxxxxxxxxxxxx
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: OutlinedButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  on_Bording_screens(),));
                },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), // التحكم في انحناء الحواف
                        ),
                        minimumSize: Size(200, 60),
                        backgroundColor: app_color.appColorGeneral
                    ),
                    child: Text("Let’s Start", style: TextStyle(
                      color: app_color.appColorsWhite,
                      fontSize: 15,
                    ),)),
              )
            ],
          ),
        )
    );
  }
}