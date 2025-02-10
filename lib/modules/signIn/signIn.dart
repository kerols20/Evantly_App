import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_icons.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/core/services/Validator.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _EmailController = TextEditingController();
  final _PaaswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Image.asset(
                  app_images.splachLogo,
                  height: screenHeight * 0.25,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your Email";
                    }
                    if (!Validator.validateEmail(value)) {
                      return "Please enter a valid Email";
                    }
                    return null;
                  },
                  controller: _EmailController,
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  prefixIcon: Icons.email_rounded,
                ),
                SizedBox(height: screenHeight * 0.009),
                CustomFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  controller: _PaaswordController,
                  isPassword: true,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.remove_red_eye,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PagesRouteName.RePassword);
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ).setRight(),
                SizedBox(height: screenHeight * 0.009),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      firebasefunction
                          .login(_EmailController.text, _PaaswordController.text)
                          .then((value) {
                        if (value == true) {
                          Navigator.pushNamed(context, PagesRouteName.layoutHome);
                        }
                      });
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: app_color.appColorsWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.85, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: app_color.appColorGeneral,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t Have Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PagesRouteName.Creat_Account);
                      },
                      child: Text("Create Account"),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: app_color.appColorGeneral,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(
                        color: app_color.appColorGeneral,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage(icons_app.GoogelIcon)),
                      SizedBox(width: 10),
                      Text("Login With Google"),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: app_color.appColorGeneral,
                    ),
                    minimumSize: Size(screenWidth * 0.85, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: app_color.appColorsWhite,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ).setCenter(),
          ),
        ),
      ),
    );
  }
}
