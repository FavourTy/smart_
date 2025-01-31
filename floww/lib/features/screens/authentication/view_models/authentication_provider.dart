import 'package:floww/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseServices firebaseService;

  bool loading = false;
  AuthenticationProvider({required this.firebaseService});
  Future<({bool loggedIn, String? error})> login(
      {required String email, required String password}) async {
    loading = true;
    final login = await firebaseService.login(email: email, password: password);
    if (login.loggedIn ?? false) {
      loading = false;
      notifyListeners();
      return (loggedIn: true, error: null);
    } else {
      loading = false;
      notifyListeners();
      return (loggedIn: false, error: login.error);
    }
  }
}
