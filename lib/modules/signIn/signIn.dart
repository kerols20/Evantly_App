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
  /// to use iv valid on Email and password when he login like create account
  final _EmailController = TextEditingController();
  final _PaaswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body:
         Form(
           key: formKey,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(app_images.splachLogo,height: mediaQuery.size.height *0.25
              ),
              CustomFormField(
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return "plz enter your Email";
                  }
                  if(!Validator.validateEmail(value)){
                    return "plz enter a valid Email";
                  }
                  return null;
                },
                controller: _EmailController,
                labelText: 'Email', hintText: 'example@gmail.com',prefixIcon: Icons.email_rounded, ),
              SizedBox(height:10 ,),
              //////////////////////////////////////////////
              CustomFormField(
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return "plz enter your password";
                  }
                  return null;
                },
                controller: _PaaswordController,
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
                ////////////////////////x///////////////////////
                if(formKey.currentState!.validate()){
                  firebasefunction.login(_EmailController.text, _PaaswordController.text).then((value) {
                    if(value == true){
                      Navigator.pushNamed(context, PagesRouteName.layoutHome);
                    }
                  },);
                }
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
              ),
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(left: 10, right: 10),
                child: OutlinedButton(onPressed: () {
                  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                }, child:Row(
                  children: [
                    SizedBox(width: 120,),
                    ImageIcon(AssetImage(icons_app.GoogelIcon,)),
                    SizedBox(width: 10,),
                    Text("Login With Google")
                  ],
                ) ,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: app_color.appColorGeneral
                    ),
                      minimumSize: Size(390, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: app_color.appColorsWhite
                  ),
                ),
              ),
            ],
                   ).setCenter(),
         ),
    );
  }
}
