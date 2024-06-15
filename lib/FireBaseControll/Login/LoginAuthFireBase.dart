import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';

class LoginAuthFireBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> _userData = [];
  String passwordCheck = "";
  late DocumentReference documentReference;

  Future<void> getDataFromFireBase(String password) async {
    documentReference = FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid);
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .where("userId", isEqualTo: _auth.currentUser!.uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      _userData = querySnapshot.docs.map((e) => e.data()).toList();
      for (var data in _userData) {
        passwordCheck = data["Password"];
        //dateGetCurrentUser = data["createdAt"];
      }
    }
    if (passwordCheck != password && passwordCheck.isNotEmpty && passwordCheck.length > 5) {
      documentReference.update({"Password": password});
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if(credential.user!=null)
        {
          return credential.user;
        }
    }on FirebaseAuthException catch(e){
      if (e.code == 'failed-precondition') {
        SessionController().haveException = true;
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
      if (e.code == 'user-not-found') {
        SessionController().haveException = true;
        // If the error is related to network issues
        Fluttertoast.showToast(
            msg:
            "User not Found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
      }
      if (e.code == 'network-request-failed') {
        SessionController().haveException = true;
        Fluttertoast.showToast(
            msg:
            "No internet connection. Please check your network settings.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
      }
    }
    return null;
  }
}
