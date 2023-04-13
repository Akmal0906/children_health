import 'package:children_health/pages/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseuser = auth.currentUser;
    return firebaseuser != null;
  }

  static Future<User?> signInUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User? firebaseuser = auth.currentUser;
    return firebaseuser;
  }

  static Future<User?> signUpUser(
      String name, String email, String password) async {
    var authresult = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

     User? user = authresult.user;
    return user;
  }

  static signOutUser(BuildContext context) {
    auth.signOut();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const SignInScreen()));
  }
}
