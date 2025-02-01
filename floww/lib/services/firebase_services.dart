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
    "https://unsplash.com/photos/a-man-covering-his-face-with-his-hands-bUAyGFl0hr4",
    "https://unsplash.com/photos/a-room-that-has-a-bunch-of-pictures-on-the-wall-nk0k9RxCrp4",
    "https://unsplash.com/photos/a-neon-sign-that-says-make-yourself-on-priority-u_SSajnrm60",
    "https://unsplash.com/photos/a-small-white-and-black-object-in-a-field-I6y-lF-OZMY",
    "https://unsplash.com/photos/a-couple-of-people-standing-on-top-of-a-beach-_FzFR_GT8As",
    "https://unsplash.com/photos/a-couple-of-horses-that-are-standing-in-the-dirt-DhvN-is1ntk",
    "https://unsplash.com/photos/a-view-of-a-ski-resort-from-the-top-of-a-hill-GIBekCz0MjU",
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
      _firestore.collection("users").doc(user.user!.uid).set({
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
