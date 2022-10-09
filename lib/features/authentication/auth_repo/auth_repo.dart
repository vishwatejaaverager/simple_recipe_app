import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/features/authentication/screens/login_screen.dart';
import 'package:food/screens/dashboard.dart';
import 'package:food/screens/show_screen.dart';
import 'package:food/utils/utils.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signUpWithEmail(BuildContext context, String email, String pass) async {
    //User? user;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
    
      Navigator.pushNamed(context, LoginScreen.routename);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  void signInUser(BuildContext context, String email, String passs) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: passs);
      Navigator.pushNamedAndRemoveUntil(
          context, ShowScreen.routename, ((route) => false));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
