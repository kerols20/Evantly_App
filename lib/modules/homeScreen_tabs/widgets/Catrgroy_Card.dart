import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CatrgroyCard extends StatelessWidget {
  const CatrgroyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(app_images.HolidayImage),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, right: 290),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text("25", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: app_color.appColorGeneral,
                        ),),
                        Text("NOV", style: TextStyle(
                          fontSize: 16,
                          color: app_color.appColorGeneral,
                        ),),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                        color: app_color.appColorsWhite,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ],
              ),
            ),
            50.spaceVertcial,
            Padding(
              padding:  EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: app_color.appColorsWhite,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Text("this is a funny Hoilday "),
                    Spacer(),
                    Icon(Icons.favorite_border, )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
