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
    //////////////////xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx///////////////
    CollectionReference <EventDataModel> addToFireStore(){
      // CollectionRef is object from type FirebaseFirestore
      // from type EventDataModel , addToFireStore name function
      FirebaseFirestore CollectionRef =  FirebaseFirestore.instance;//( here create collection from CollectionRef collection is premter from FirebaseFirestore
      // CollectionRef is object from  FirebaseFirestore  take from he instance)
     return CollectionRef.collection(EventDataModel.collectionNamed).withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) => EventDataModel.fromJason(snapshot.data()!) ,
          //                                                        // snapshot (بيكون محتاج الماب ) .data(جلب الداتا)
          toFirestore: (value, _) => value.tofireStore(),);

    }
    // CreateNewEvant will take object from EventDataModel
     Future<void> CreateNewEvant(EventDataModel CreateNewEvant )async{
      // (غير صحيح اكسس عنصر مش ستاتك داخل بلوك استاسك )
       // (صحيح اكسس عنصر استاتك داخل بلوك مش استاتك )
      // first add addToFireStore and named CollectionRef
      final CollectionRef = addToFireStore();
      // second create a document on firestore under your collection
      var document =  CollectionRef.doc();
      // here we gat the EvantId from document to do on it oprtion
      // CreateNewEvant is object . assignment EvantId == document.id
      CreateNewEvant.EvantId = document.id;
      //(هنا بعد عمل ديكومنت فاضي جيب منه الايدي وادي لdocument )
      // sand to him object CreateNewEvant and he will converted to jason
      // set collection document .set(CreateNewEvant) object
      return document.set(CreateNewEvant);
    }
  }














  // kerolos adel
// kokoqaw4@gmai.com
// kokoadelsam



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



































//import 'package:flutter/material.dart';
//
// class CreateEvant extends StatefulWidget {
//   @override
//   State<CreateEvant> createState() => _CreateEvantState();
// }
//
// class _CreateEvantState extends State<CreateEvant> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final _TitleControl = TextEditingController();
//   final _descreption = TextEditingController();
//   int selectedTab = 0; // لتحديد التاب المختار
//
//   List<EvantCatrory> eventCategories = [
//     EvantCatrory(
//         evantCategoryName: "BookClub",
//         evantCategoryIcon: Icons.menu_book_rounded,
//         evantCategoryImage: "assets/images/bookclub.jpg"),
//     EvantCatrory(
//         evantCategoryName: "Sports",
//         evantCategoryIcon: Icons.directions_bike,
//         evantCategoryImage: "assets/images/sports.jpg"),
//     EvantCatrory(
//         evantCategoryName: "Holiday",
//         evantCategoryIcon: Icons.beach_access,
//         evantCategoryImage: "assets/images/holiday.jpg"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: eventCategories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Create Event",
//             style: TextStyle(fontSize: 22, color: Colors.blue),
//           ),
//           bottom: TabBar(
//             onTap: (index) {
//               setState(() {
//                 selectedTab = index; // تحديث التاب المختار
//               });
//             },
//             indicatorColor: Colors.blue,
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             tabs: eventCategories
//                 .map((category) => Tab(
//                       icon: Icon(category.evantCategoryIcon),
//                       text: category.evantCategoryName,
//                     ))
//                 .toList(),
//           ),
//         ),
//         body: Column(
//           children: [
//             SizedBox(height: 20),
//             // ✅ عرض الصورة المتغيرة حسب التاب المحدد
//             Image.asset(
//               eventCategories[selectedTab].evantCategoryImage,
//               fit: BoxFit.cover,
//               height: 250,
//               width: double.infinity,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class EvantCatrory {
//   final String evantCategoryName;
//   final IconData evantCategoryIcon;
//   final String evantCategoryImage;
//
//   EvantCatrory({
//     required this.evantCategoryName,
//     required this.evantCategoryIcon,
//     required this.evantCategoryImage,
//   });
// }