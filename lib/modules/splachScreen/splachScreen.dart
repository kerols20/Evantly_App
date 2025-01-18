import 'dart:async';

import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(context, PagesRouteName.scound,
          (route) => false,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset(app_images.splachLogo,height: Size.size.height *0.25,),
         ],
        ),
      ),
    );
  }
}

