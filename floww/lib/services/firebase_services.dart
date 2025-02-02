//step 1 create a  firebase services class
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  //create an instance of firebase
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return auth.currentUser;
  }

  final List<String> profileImages = [
    "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        "https://images.unsplash.com/photo-1737920406899-e1cabc43a6a7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1736754074555-54b6abcb2fb4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzMHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1735252723552-138dc3fb6f14?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0M3x8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1737958944516-5f5a030b7e5d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1OXx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1737991864069-508dd72239fc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2MHx8fGVufDB8fHx8fA%3D%3D"
  ];

  Future<({bool loggedIn, String? error})> login(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      await auth.currentUser?.reload(); // Ensure we refresh user state

      if (auth.currentUser == null) {
        return (loggedIn: false, error: "Login failed. Please try again.");
      }
      return (loggedIn: true, error: null);
    } on FirebaseAuthException catch (e) {
      return (loggedIn: false, error: e.message);
    } catch (e) {
      return (
        loggedIn: false,
        error: "An unknown error occurred: ${e.toString()}"
      );
    }
    // try {
    //   await auth.signInWithEmailAndPassword(email: email, password: password);
    //   auth.currentUser?.reload;
    //   return (loggedIn: true, error: null);
    // } on FirebaseException catch (e) {
    //   return (loggedIn: false, error: e.message);
    // } catch (e) {
    //   return (loggedIn: false, error: e.toString());
    // }
  }

//making use of dart records to check print error messages
  Future<({bool signedIn, String? error})> signIn({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await auth.currentUser?.reload();

      final String randomProfileImage =
          profileImages[Random().nextInt(profileImages.length)];
      _firestore.collection("Users").doc(user.user!.uid).set({
        'uid': user.user!.uid,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'profileImage': randomProfileImage,
      }).then((_) {
        print("✅ User added to Firestore: ${user.user!.uid}");
      }).catchError((error) {
        print("🔥 Error saving user: $error");
      });
      // Ensure user is actually signed in
      if (auth.currentUser == null) {
        return (signedIn: false, error: "Sign-up failed. Please try again.");
      }

      return (signedIn: true, error: null);
    } on FirebaseAuthException catch (e) {
      return (signedIn: false, error: e.message);
    } catch (e) {
      return (
        signedIn: false,
        error: "An unknown error occurred: ${e.toString()}"
      );
    }

    //wrap w try and catch block to catch exceptions
    // try {
    //   await auth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //       //reload meaans to check the data again whether you are signed in or not
    //   await auth.currentUser?.reload();
    //   return (signedIn: true, error: null);
    // }
    // // if it is a firebaseException Issue Run this
    // on FirebaseException catch (e) {
    //   return (signedIn: false, error: e.message);
    // }
    // // Generic Exception: if the issue is from us Run this default catch
    // catch (e) {
    //   //e.toString means casting the error to string
    //   return (signedIn: false, error: e.toString());
    // }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (_) {}
  }
}
