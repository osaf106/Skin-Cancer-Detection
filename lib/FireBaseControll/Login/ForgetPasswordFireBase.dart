import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasswordFireBase
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> ForgetUserPasswordFireBase(String email) async
  {
    try{
      await _auth.sendPasswordResetEmail(
          email: email,
      );
      return true;
    }on FirebaseAuthException catch(e){
      if (e.code == 'failed-precondition') {
        // If the error is related to network issues
        Fluttertoast.showToast(
            msg:
            "Unable to connect to the internet. Please check your network connection and try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
      }
      if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            msg:
            "No internet connection. Please check your network settings.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
      }
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg:
            "Email Doesn't Exits",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
      }
      print("Exception by Osaf ${e}");
    }
  return false;
  }
}