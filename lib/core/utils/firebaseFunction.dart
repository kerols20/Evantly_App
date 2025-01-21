import 'package:firebase_auth/firebase_auth.dart';

class firebasefunction{
   static createAccount(String email, String Paasword )async{
     try {UserCredential Credential = await FirebaseAuth.instance.
     createUserWithEmailAndPassword(email: email, password: Paasword);} on FirebaseAuthException catch (x) {
       if(x.code == "weak_password"){
         print("the password is weak");
       }
       else if (x.message == "email is already use"){
         print("email is already use");
       }
     }catch(x){
       print(x);
     }
   }
}

// UserCredential