// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class SignInController {
//   final BuildContext context;
//   const SignInController({required this.context});
//   Future<void> handleSignIn(String type) async {
//     try {
//       if (type == "email") {
//         String emailAddress = state.email;
//         String password = state.password;
//         if (emailAddress.isEmpty) {
//           return;
//         }
//         if (password.isEmpty) {
//           return;
//         }
//         try {
//           final credential = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(
//                   email: emailAddress, password: password);

//           var user = credential.user;
//           if (user != null) {
          
//             Navigator.of(context)
//                 .pushNamedAndRemoveUntil("/home", (route) => false);
//           } else {
//             return;
//           }
//           if (!user.emailVerified) {
//             return;
//           }
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'user-not-found') {
//           } else if (e.code == 'wrong-password') {
//           } else if (e.code == 'invalid-email') {
           
//           }
//         }
//       }
//     } catch (e) {}
//   }
// }
