import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(app_images.splachLogo,height: mediaQuery.size.height *0.25
          ),
          CustomFormField(labelText: 'Email', hintText: 'example@gmail.com',prefixIcon: Icons.email_rounded, ),
          SizedBox(height:10 ,),
          CustomFormField(
            isPassword: true,
            labelText: 'Password', hintText: 'Enter your password',prefixIcon: Icons.lock_outline, suffixIcon: Icons.remove_red_eye, ),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, PagesRouteName.RePassword);
          }, child: Text("Forget Password?", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
          ).setRight(),
          OutlinedButton(onPressed: () {
            //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          }, child: Text("Login", style: TextStyle(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Don’t Have Account ?"),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, PagesRouteName.Creat_Account);
              }, child: Text("Create Account"))
            ],
          ),
          Row(
            children: [
              Expanded(child: Divider(
                color: app_color.appColorGeneral,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),),
              Text("OR"),
              Expanded(child: Divider(
                indent: 20,
                endIndent: 20,
                color: app_color.appColorGeneral,
                thickness: 2,
              ),),
            ],
          )
        ],
      ).setCenter(),
    );
  }
}
