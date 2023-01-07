import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  // Inisiasi autentikasi class untuk method Register, Login, atau Log Out
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  // SignUp atau Register Method Auth Firebase
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  // SignIn atau Login Method Auth Firebase
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  // SignOut atau LogOut Method
  Future signOut() async {
    await _auth.signOut();
  }
}
