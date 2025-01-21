import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter_easyloading/flutter_easyloading.dart';
  class firebasefunction  {
     static Future<bool> createAccount(
         String email, String Paasword )async{
       EasyLoading.show();
       try {
         final Credential =
         await FirebaseAuth.instance.
       createUserWithEmailAndPassword(email: email, password: Paasword
         );
         SanckBarServices.showSuccessMessage("Account Created Successfully");
         return Future.value(true);
       } on FirebaseAuthException catch (x) {
         if(x.code == "weak_password"){
           print("the password is weak");
           return Future.value(false);
         } else if (x.message == "email is already use"){
           EasyLoading.dismiss();
           print("email is already use");
           return Future.value(false);
         }
         return Future.value(false);
       }catch(x){
         print(x);
         return Future.value(false);
       }
     }
  }

  // UserCredential