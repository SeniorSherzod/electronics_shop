// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../screens/tabs/profile_screen/profile_screen.dart';
//
// class LoginViewModel extends ChangeNotifier {
//   String email = "";
//   String password = "";
//
//   updateEmail(String v) {
//     email = v;
//   }
//
//   updatePassword(String v) {
//     password = v;
//   }
//
//   passworVisiblity(bool isVisible){
//     isVisible=true;
//   }
//   login(BuildContext context) async {
//     try {
//       final credential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       if (credential.user!.uid.isNotEmpty) {
//         debugPrint("UID:${credential.user!.uid}");
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return ProfileScreen();
//         }));
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }