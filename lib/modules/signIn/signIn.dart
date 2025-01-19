import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(app_images.splachLogo,height: Size.size.height *0.25
          ),
          CustomFormField(labelText: 'Email', hintText: 'example@gmail.com',prefixIcon: Icons.email_rounded, ),
          SizedBox(height:10 ,),
          CustomFormField(
            isPassword: true,
            labelText: 'Password', hintText: 'Enter your password',prefixIcon: Icons.lock_outline, suffixIcon: Icons.remove_red_eye, ),
        ],
      ).setCenter(),
    );
  }
}
