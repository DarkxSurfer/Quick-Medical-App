// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// class AuthService extends ChangeNotifier {
//   // Firebase Auth instance
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   // Firestore instance
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Sign in user with email and password
//   Future<UserCredential> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);

//       // Update Firestore with the user's information
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': email,
//       }, SetOptions(merge: true));

//       return userCredential;

//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception("An unexpected error occurred. Please try again.");
//     }
//   }

//   // Create a new user with email, password, and username
//   Future<UserCredential> createUserWithEmailAndPassword(
//       String email, String password, String username) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);

//       // Create a new document for the user in the users collection
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': email,
//         'name': username,
//       });

//       return userCredential;

//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception("An unexpected error occurred. Please try again.");
//     }
//   }

//   // Sign out the current user
//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//     } catch (e) {
//       throw Exception("An error occurred while signing out. Please try again.");
//     }
//   }

//   // Private method to handle FirebaseAuthException
//   Exception _handleAuthException(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return Exception("No user found for that email.");
//       case 'wrong-password':
//         return Exception("Wrong password provided.");
//       case 'email-already-in-use':
//         return Exception("The email address is already in use by another account.");
//       case 'invalid-email':
//         return Exception("The email address is not valid.");
//       case 'weak-password':
//         return Exception("The password is too weak.");
//       default:
//         return Exception("Authentication failed. Please try again.");
//     }
//   }
// }
