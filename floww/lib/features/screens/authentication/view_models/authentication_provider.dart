// ignore_for_file: unnecessary_null_comparison

import 'package:floww/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseServices firebaseService;

  bool loading = false;
  AuthenticationProvider({required this.firebaseService});
  Future<({bool loggedIn, String? error})> login(
      {required String email, required String password}) async {
    loading = true;
    notifyListeners();
    final login = await firebaseService.login(email: email, password: password);
    if (login.loggedIn != null) {
      loading = false;
      notifyListeners();
      return (loggedIn: true, error: null);
    } else {
      loading = false;
      notifyListeners();
      return (loggedIn: false, error: login.error);
    }
  }

  Future<({bool registered, String? error})> register(
      {required String email, required String password}) async {
    loading = true;
    notifyListeners();
    final login =
        await firebaseService.signIn(email: email, password: password);
    if (login.signedIn != null) {
      loading = false;
      notifyListeners();
      return (registered: true, error: null);
    } else {
      loading = false;
      notifyListeners();
      return (registered: false, error: login.error);
    }
  }
}
