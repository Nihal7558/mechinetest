import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebaceservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> signin(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Entered Scussefully")));
      }
      return credential;
    } on FirebaseAuthException {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(" Not Entered Scussefully")));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> createUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Entered Scussefully")));
      }
      return credential;
    } on FirebaseAuthException {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(" Not Entered Scussefully")));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> signout() async {
    _auth.signOut();
  }
}

class Firebaseauthservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final useremail = FirebaseAuth.instance.currentUser?.email;

  Firebaseauthservices();

  void showsnackbar(BuildContext context, String message, Color color) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
        ),
      );
    }
  }

  Future<UserCredential?> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        showsnackbar(context, "Login Successful", Colors.green);
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      showsnackbar(
        context,
        e.message ?? "Something went wrong",
        Colors.red,
      );
    } catch (e) {
      print("Error: $e");
      showsnackbar(context, "An unknown error occurred", Colors.red);
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      if (context.mounted) {
        showsnackbar(context, "Logout Successful", Colors.green);
      }
    } catch (e) {
      print("Error: $e");
      if (context.mounted) {
        showsnackbar(context, "Failed to logout", Colors.red);
      }
    }
  }
}
