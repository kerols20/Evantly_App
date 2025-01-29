import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter_easyloading/flutter_easyloading.dart';
  class firebasefunction {
    static Future<bool> createAccount(String email, String password) async {
      EasyLoading.show();
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        EasyLoading.dismiss();
        SanckBarServices.showSuccessMessage("Account Created Successfully");
        return Future.value(true);
      } on FirebaseAuthException catch (x) {
        EasyLoading.dismiss();
        if (x.code == "weak-password") {
          print("The password is weak");
        } else if (x.code == "email-already-in-use") {
          SanckBarServices.showErrorMessage("Email is already in use");
          print("Email is already in use");
        }
        return Future.value(false);
      } catch (x) {
        EasyLoading.dismiss();
        print(x);
        return Future.value(false);
      }
    }
    static Future<bool> login(String email, String password) async {
      EasyLoading.show();
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        EasyLoading.dismiss();
        SanckBarServices.showSuccessMessage("Account logged in successfully");
        return Future.value(true);
      } on FirebaseAuthException catch (x) {
        EasyLoading.dismiss();

        if (x.code == "wrong-password") {
          SanckBarServices.showErrorMessage("Password is incorrect");
        } else if (x.code == "user-not-found") {
          SanckBarServices.showErrorMessage("Email not found. Please check your email or create an account.");
        } else {
          SanckBarServices.showErrorMessage("An unexpected error occurred. Please try again.");
        }

        return Future.value(false);
      } catch (x) {
        EasyLoading.dismiss();
        print("Error: $x");
        SanckBarServices.showErrorMessage("Something went wrong. Please try again.");
        return Future.value(false);
      }
    }

  }