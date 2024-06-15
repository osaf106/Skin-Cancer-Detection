//import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_info/d_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/HomePage.dart';
import 'package:skin_cancer_detection/Screens/Login/ForgetPassword.dart';
import 'package:skin_cancer_detection/Screens/Signup/Signup.dart';
import '../../FireBaseControll/Login/LoginAuthFireBase.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginAuthFireBase _authService = LoginAuthFireBase();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // String GetName="", GetEmail="";

  bool _obscureText = true;

  // Future<void> FetchData() async{
  //   try{
  //     QuerySnapshot<Map<String,dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').where('Email', isEqualTo: emailController.text.trim()).get();
  //     snapshot.docs.forEach((doc) {
  //       // Access specific fields like Name and Email from each document's data
  //       GetName = doc['Name'];
  //       GetEmail = doc['Email'];
  //       print(GetName+" Email : "+GetEmail);
  //     });
  //     //GetDataFromFireBaseForMenu.getFetchedData(GetEmail,GetName);
  //   }catch(e){
  //     print("error: $e");
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    double currentApplicationHeight = MediaQuery.of(context).size.height;
    const LinearGradient gradient_ = LinearGradient(
      colors: [
        Color(0xFF199ADD),
        Color(0xFF14BBD4),
      ],
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // this is for Blue Screen
            Container(
              width: double.infinity,
              height: currentApplicationHeight / 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color(0xFF199ADD),
                    Color(0xFF14BBD4),
                  ],
                      begin: FractionalOffset(1.0, 1.0),
                      end: FractionalOffset(0.0, 1.0))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Text(
                    "Skin Guard \n Application ",
                    style: TextStyle(
                      fontSize: currentApplicationWidth > 400 &&
                              currentApplicationHeight > 700
                          ? 35
                          : currentApplicationWidth > 350 &&
                                  currentApplicationHeight > 650
                              ? 28
                              : currentApplicationWidth > 320 &&
                                      currentApplicationHeight > 620
                                  ? 23
                                  : currentApplicationWidth > 270 &&
                                          currentApplicationHeight > 570
                                      ? 20
                                      : 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFf9f8fd),
                    ),
                  ),
                ),
              ),
            ),
            // This is for White bottom Screen
            Padding(
              padding: const EdgeInsets.only(top: 370.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            // This is for Upper Screen
            Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 15, right: 15),
              child: Center(
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: currentApplicationWidth > 400
                        ? 400
                        : currentApplicationWidth > 345
                            ? 345
                            : 330,
                    height: currentApplicationHeight > 800
                        ? 520
                        : currentApplicationHeight > 700
                            ? 480
                            : currentApplicationHeight > 670
                                ? 460
                                : currentApplicationHeight > 610
                                    ? 430
                                    : currentApplicationHeight > 550
                                        ? 390
                                        : currentApplicationHeight > 530
                                            ? 350
                                            : currentApplicationHeight > 500
                                                ? 320
                                                : 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(4.0, 4.0),
                            blurRadius: 13),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome
                        Center(
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return gradient_.createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                    fontSize: currentApplicationWidth > 400 &&
                                            currentApplicationHeight > 800
                                        ? 28
                                        : currentApplicationWidth > 340 &&
                                                currentApplicationHeight > 700
                                            ? 23
                                            : currentApplicationWidth > 300 &&
                                                    currentApplicationHeight >
                                                        661
                                                ? 20
                                                : 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        //Login
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return gradient_.createShader(Rect.fromLTWH(
                                0, 0, bounds.width, bounds.height));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: currentApplicationWidth > 400 &&
                                        currentApplicationHeight > 800
                                    ? 25
                                    : currentApplicationWidth > 340 &&
                                            currentApplicationHeight > 700
                                        ? 22
                                        : currentApplicationWidth > 300 &&
                                                currentApplicationHeight > 661
                                            ? 18
                                            : 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // Space
                        SizedBox(
                            height: currentApplicationHeight > 800 ? 40 : 20),
                        // Email
                        Center(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return gradient_.createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height));
                            },
                            child: SizedBox(
                              width: currentApplicationWidth > 400
                                  ? 320
                                  : currentApplicationWidth > 340
                                      ? 290
                                      : currentApplicationWidth > 270
                                          ? 240
                                          : 200,
                              height: currentApplicationHeight > 800
                                  ? 60
                                  : currentApplicationHeight > 600
                                      ? 50
                                      : 40,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    //hintText: "Email",
                                    labelText: "Email",
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ))),
                              ),
                            ),
                          ),
                        ),
                        // Space
                        const SizedBox(height: 25),
                        // Password
                        Center(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return gradient_.createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height));
                            },
                            child: SizedBox(
                              width: currentApplicationWidth > 400
                                  ? 320
                                  : currentApplicationWidth > 340
                                      ? 290
                                      : currentApplicationWidth > 270
                                          ? 240
                                          : 200,
                              height: currentApplicationHeight > 800
                                  ? 60
                                  : currentApplicationHeight > 600
                                      ? 50
                                      : 40,
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    // hintText: "Password",
                                    labelText: "Password",
                                    prefixIcon: const Icon(
                                      Icons.key_outlined,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          _obscureText == false
                                              ? _obscureText = true
                                              : _obscureText = false;
                                        });
                                      },
                                      icon: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ))),
                                obscureText: _obscureText,
                              ),
                            ),
                          ),
                        ),
                        // Space
                        const SizedBox(height: 10),
                        // Forget Password
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPassword()));
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: currentApplicationWidth > 400 &&
                                              currentApplicationHeight > 800
                                          ? 15
                                          : currentApplicationWidth > 340 &&
                                                  currentApplicationHeight > 600
                                              ? 12
                                              : 10,
                                      color: const Color(0xff6D6D6D)),
                                ),
                              )),
                        ),
                        // Space
                        const SizedBox(height: 15),
                        // Button of Login
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              _login();
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
                              // FetchData();
                            },
                            child: Container(
                              width: currentApplicationWidth > 400
                                  ? 320
                                  : currentApplicationWidth > 340
                                      ? 290
                                      : currentApplicationWidth > 270
                                          ? 240
                                          : 200,
                              height: currentApplicationHeight > 800
                                  ? 60
                                  : currentApplicationHeight > 600
                                      ? 50
                                      : 40,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF199ADD),
                                        Color(0xFF14BBD4),
                                      ],
                                      begin: FractionalOffset(1.0, 1.0),
                                      end: FractionalOffset(0.0, 1.0)),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: currentApplicationWidth > 400 &&
                                              currentApplicationHeight > 800
                                          ? 15
                                          : currentApplicationWidth > 340 &&
                                                  currentApplicationHeight > 600
                                              ? 12
                                              : 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: currentApplicationWidth > 400 &&
                                            currentApplicationHeight > 800
                                        ? 15
                                        : currentApplicationWidth > 340 &&
                                                currentApplicationHeight > 600
                                            ? 12
                                            : 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Space
                        const SizedBox(height: 10),
                        // Don't Have Account
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Don't have account",
                            style: TextStyle(
                                fontSize: currentApplicationWidth > 400 &&
                                        currentApplicationHeight > 800
                                    ? 15
                                    : currentApplicationWidth > 340 &&
                                            currentApplicationHeight > 600
                                        ? 12
                                        : 10,
                                color: const Color(0xff6d6d6d),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return gradient_.createShader(Rect.fromLTWH(
                                0, 0, bounds.width, bounds.height));
                          },
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: currentApplicationWidth > 400 &&
                                              currentApplicationHeight > 800
                                          ? 20
                                          : currentApplicationWidth > 340 &&
                                                  currentApplicationHeight > 600
                                              ? 18
                                              : 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (isLoading)
                    const Center(
                      child:
                      CircularProgressIndicator(
                          semanticsValue: 'Loading',
                          semanticsLabel: 'Loading',
                          // backgroundColor: Colors.grey,
                          strokeWidth: 4,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blueAccent)),
                    )
                ]),
              ),
            )
          ],
        ));
  }

  bool _isValidEmail(String email) {
    // Simple email validation using a regular expression.
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isLoading = false;

  void createLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void endLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void _login() async {
    bool isEmailValid = _isValidEmail(emailController.text.trim());
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      if (passwordController.text.length > 5) {
        if (isEmailValid == true) {
          createLoading();

            User? user = await _authService.loginWithEmailAndPassword(
                emailController.text.trim(), passwordController.text.trim());
            //FirebaseAuth authInstanceCheckActive = FirebaseAuth.instance;
            if (user != null) {
              _authService.getDataFromFireBase(passwordController.text.trim());
              //final currentuser = _authinstance.currentUser;
              SessionController().userId = user.uid.toString();
              //SessionController().userId = currentuser!.uid.toString();
              endLoading();
              DInfo.dialogSuccess(context, 'Login Successfully');
              //DInfo.notifSuccess("Sucess", "Check your Email");
              DInfo.closeDialog(context,
                  durationBeforeClose: const Duration(seconds: 3),
                  actionAfterClose: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageScreen()));
                  });
            }else if(SessionController().haveException == true)
              {
                SessionController().haveException = false;
                endLoading();
              }
            else {
              Fluttertoast.showToast(
                   msg: "Wrong Email or Password, try again!",
                 // msg: "Unable to connect to the internet. Please check your network connection and try again.!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 15.0);
              endLoading();
            }
        } else {
          Fluttertoast.showToast(
              msg: "Email Pattern is Incorrect",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 15.0);
          endLoading();
        }
      } else {
        Fluttertoast.showToast(
            msg: "Password Must be in 6 Characters",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
        endLoading();
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Fill the each Field",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
      endLoading();
    }
  }
}
