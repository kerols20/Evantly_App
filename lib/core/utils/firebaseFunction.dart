import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
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

    //////////////////xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx///////////////
    // Firestore collection reference with converter
    CollectionReference<EventDataModel> addToFireStore() {
      FirebaseFirestore collectionRef = FirebaseFirestore.instance;
      return collectionRef
          .collection(EventDataModel.collectionNamed)
          .withConverter<EventDataModel>(
        fromFirestore: (snapshot, _) =>
            EventDataModel.fromJason(snapshot.data()!),
        toFirestore: (value, _) => value.tofireStore(),
      );
    }
    Future<bool> CreateNewEvant(EventDataModel CreateNewEvant) async {
      try {
        var collectionRef = addToFireStore();
        var document = collectionRef.doc();
        CreateNewEvant.EvantId = document.id;
        await document.set(CreateNewEvant);
        return Future.value(true);
      } catch (error) {
        print("❌ Error creating event: $error");
        return Future.value(false);
      }
    }

// Retrieve event data from Firestore
    Future<List<EventDataModel>> gatDataFromFireStore() async {
      var collectionRef = addToFireStore();
      try {
        QuerySnapshot<EventDataModel> data = await collectionRef.get();
        List<EventDataModel> eventDataList = data.docs.map((doc) => doc.data()).toList();
        print("🔥 Retrieved ${eventDataList.length} event(s)");
        return eventDataList;
      } catch (e) {
        print("❌ Error retrieving data: $e");
        return [];
      }
    }
    Stream<QuerySnapshot<EventDataModel>> RealStreemDats(String categryName){
      // first add collction Ref
      var collectionRef = addToFireStore().where("EvantCategray", isEqualTo: categryName);
      return collectionRef.snapshots();
    }
    //////////////////////////////////////////////////////////////////////////////////////////////
    Stream<QuerySnapshot<EventDataModel>> favoriteFireStore(){
      // first add collction Ref
      var collectionRef = addToFireStore().where("isfavorute", isEqualTo: true);
      return collectionRef.snapshots();
    }
    Future<void> deleteEvent(String documentId) async {
      try{
        var collectionRef = addToFireStore();
        var docref = collectionRef.doc(documentId);
        docref.delete();
        Future.value(true);
      } catch (error) {
        Future.value(false);
      }
    }
    Future<void> updetEvent(String documentId, Map<String, dynamic> updateData) async {
      try {
        var collectionRef = addToFireStore();
        var docRef = collectionRef.doc(documentId);
        await docRef.update(updateData);
      } catch (error) {
        print("❌ Error updating event: $error");
      }
    }

  }













  // kerolos adel
// kokoqaw4@gmai.com
// kokoadelsam

// API key
// AIzaSyCA5tq9Fs3CtRTp9pbCxsljCxQcjNl1B3I

// static Future<void> CreateNewEvant(EventDataModel CreateNewEvant )async{
// (error Bacuse cant assignment a nonstatic virible from out side )
// // first add addToFireStore and named CollectionRef
// final CollectionRef = addToFireStore();
// // second create a document on firestore under your collection
// var document =  CollectionRef.doc();
// // here we gat the EvantId from document to do on it oprtion
// // CreateNewEvant is object . assignment EvantId == document.id
// CreateNewEvant.EvantId = document.id;
// //(هنا بعد عمل ديكومنت فاضي جيب منه الايدي وادي لdocument )
// // sand to him object CreateNewEvant and he will converted to jason
// // set collection document .set(CreateNewEvant) object
// return document.set(CreateNewEvant);
// }