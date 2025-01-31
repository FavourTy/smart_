//step 1 create a  firebase services class
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  //create an instance of firebase
  final auth = FirebaseAuth.instance;

  Future<({bool loggedIn, String? error})> login(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      auth.currentUser?.reload;
      return (loggedIn: true, error: null);
    } on FirebaseException catch (e) {
      return (loggedIn: false, error: e.message);
    } catch (e) {
      return (loggedIn: false, error: e.toString());
    }
  }

//making use of dart records to check print error messages
  Future<({bool signedIn, String? error})> signIn(
      {required String email, required String password}) async {
    //wrap w try and catch block to catch exceptions
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.currentUser?.reload;
      return (signedIn: true, error: null);
    }
    // if it is a firebaseException Issue Run this
    on FirebaseException catch (e) {
      return (signedIn: false, error: e.message);
    }
    // Generic Exception: if the issue is from us Run this default catch
    catch (e) {
      //e.toString means casting the error to string
      return (signedIn: false, error: e.toString());
    }
  }
}
