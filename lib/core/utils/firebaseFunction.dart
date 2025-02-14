import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      EasyLoading.show(); // ✅ إظهار اللودينج أثناء العملية

      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        EasyLoading.dismiss(); // ✅ إيقاف اللودينج عند النجاح
        SanckBarServices.showSuccessMessage("Account logged in successfully");
        return Future.value(true); // ✅ إرجاع true عند النجاح
      }
      on FirebaseAuthException catch (x) {
        EasyLoading.dismiss(); // ✅ إيقاف اللودينج عند الخطأ

        if (x.code == "invalid-email") {
          SanckBarServices.showErrorMessage("The email address is not valid. Please enter a correct email.");
        }
        else if (x.code == "wrong-password") {
          SanckBarServices.showErrorMessage("Incorrect password. Please try again.");
        }
        else if (x.code == "user-not-found") {
          SanckBarServices.showErrorMessage("Email not found. Please check your email or create an account.");
        }
        else {
          SanckBarServices.showErrorMessage("An unexpected error occurred. Please try again.");
        }

        return Future.value(false); // ❌ إرجاع false عند الفشل
      }
      catch (x) {
        EasyLoading.dismiss(); // ✅ إيقاف اللودينج عند أي خطأ غير متوقع
        print("Error: $x");
        SanckBarServices.showErrorMessage("Something went wrong. Please try again.");
        return Future.value(false);
      }
    }
    // dont forget maked on rest password
    static Future <bool>  resetPassword(String email) async{
      EasyLoading.show();
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        EasyLoading.dismiss();
        SanckBarServices.showSuccessMessage("Password reset email sent");
        return Future.value(true);
    } on FirebaseAuthException catch (x) {
        EasyLoading.dismiss();
        print("Error: $x");
        SanckBarServices.showErrorMessage("Something went wrong. Please try again.");
        return Future.value(false);
      }
      }
// final
    //////////////////xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx///////////////
   static CollectionReference <EventDataModel>gatCollectionRef(){
      // take object from FirebaseFirestore
    FirebaseFirestore collRef =  FirebaseFirestore.instance;
    // get collection
    return collRef.collection(EventDataModel.collectionName).withConverter(
      // here sand data as object to firestore and get it as object
        fromFirestore: (snapshot, _) => EventDataModel.fromFirestore(snapshot.data()!),
        toFirestore: (value, options) => value.toFirestore(),);
  }
    static Future<bool> creatNewEvent(EventDataModel aventDatamodel) async {
      try {
        final collectionRef = gatCollectionRef();
        var docref = collectionRef.doc(); // إنشاء مستند جديد
        aventDatamodel.eventID = docref.id; // تعيين معرف المستند

        await docref.set(aventDatamodel);
        return true;
      } catch (e) {
        print("Error creating event: $e");
        return false;
      }
    }
    gatDateFromFireStore() async{
      final collectionRef3 = gatCollectionRef();
      var data = await collectionRef3.get();
      var EvantDateList = data.docs.map((e) => e.data()).toList();
    }
    static Stream<QuerySnapshot<EventDataModel>> RealStreemDats(String categryName) {
      var collectionRef = addToFireStore();
      var query = collectionRef.where("eventCategory", isEqualTo: categryName);
      return query.snapshots();
    }
    static CollectionReference<EventDataModel> addToFireStore() {
      FirebaseFirestore collectionRef = FirebaseFirestore.instance;
      return collectionRef
          .collection(EventDataModel.collectionName)
          .withConverter<EventDataModel>(
        fromFirestore: (snapshot, _) =>
            EventDataModel.fromFirestore(snapshot.data()!),
        toFirestore: (value, _) => value.toFirestore(),
      );
    }
    static Stream<QuerySnapshot<EventDataModel>> getStreamFavoriteData() {
      var collectionRef = gatCollectionRef().where(
        "isFavorite",
        isEqualTo: true,
      );
      return collectionRef.snapshots();
    }



    static Future<bool> updateEvent(String eventID, Map<String, dynamic> data) async {
      try {
        var collectionRef = gatCollectionRef();
        var docRef = collectionRef.doc(eventID);

        await docRef.update(data); // ✅ إضافة await لضمان اكتمال التحديث

        return true;
      } catch (error) {
        print("Error updating event: $error"); // ✅ طباعة الخطأ لتصحيح المشكلة
        return false;
      }
    }
    static loginWithGoogel() async{
      EasyLoading.show();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var googleuserCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }













  // kerolos adel
// kokoqaw4@gmai.com
// kokoadelsam

// API key
// AIzaSyCA5tq9Fs3CtRTp9pbCxsljCxQcjNl1B3I
