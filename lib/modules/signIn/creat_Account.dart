
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:flutter/material.dart';

class CreatAccount extends StatefulWidget {
   CreatAccount({super.key});

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  final _NameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PaaswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(app_images.splachLogo,height: mediaQuery.size.height *0.25
        ),
        CustomFormField(
          controller: _NameController,
          labelText: 'Name', hintText: 'Name',),
        SizedBox(height:10 ,),
        CustomFormField(
          controller: _EmailController,
          labelText: 'Email', hintText: 'Enter your Email',
        ),
        SizedBox(height:10 ,),
        CustomFormField(
          controller: _PaaswordController,
          labelText: 'Password', hintText: 'Password', isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye,),
        SizedBox(height:10 ,),
        CustomFormField(labelText: 'RePassword', hintText: 'RePassword',isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye),
        SizedBox(height: 10,),
        OutlinedButton(onPressed: () {
          firebasefunction.createAccount(_EmailController.text, _PaaswordController.text);
        }, child: Text("Creata Account", style: TextStyle(
          fontSize: 20,
          fontWeight:FontWeight.w700,
          color: app_color.appColorsWhite
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
            Text("Already Have Account ?"),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, PagesRouteName.signIn);
            }, child: Text("Login"))
          ],
        ),
      ],
    ).setCenter(),
    );
  }
}
