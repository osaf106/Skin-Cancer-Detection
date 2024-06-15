// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Login/Login.dart';
import 'package:d_info/d_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Validation

  // Controllers add for Editing
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  bool _obscureText = true;
  String groupValue = "Male";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LinearGradient _gradient = const LinearGradient(
    colors: [
      Color(0xFF199ADD),
      Color(0xFF14BBD4),
    ],
  );

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    double currentApplicationHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _formKey,
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
                  padding: const EdgeInsets.only(bottom: 238.0),
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
            Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: currentApplicationWidth > 400 &&
                              currentApplicationHeight > 700
                          ? 90
                          : currentApplicationWidth > 350 &&
                                  currentApplicationHeight > 650
                              ? 70
                              : currentApplicationWidth > 320 &&
                                      currentApplicationHeight > 620
                                  ? 60
                                  : currentApplicationWidth > 270 &&
                                          currentApplicationHeight > 570
                                      ? 50
                                      : 50,
                      left: 15,
                      right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      alignment: Alignment.center,
                        children: [
                      Container(
                        width: currentApplicationWidth > 400
                            ? 400
                            : currentApplicationWidth > 345
                                ? 345
                                : 320,
                        height: currentApplicationHeight > 700
                            ? 600
                            : currentApplicationHeight > 670
                                ? 570
                                : currentApplicationHeight > 650
                                    ? 520
                                    : currentApplicationHeight > 630
                                        ? 500
                                        : currentApplicationHeight > 610
                                            ? 490
                                            : currentApplicationHeight > 580
                                                ? 470
                                                : currentApplicationHeight > 550
                                                    ? 450
                                                    : currentApplicationHeight >
                                                            530
                                                        ? 430
                                                        : currentApplicationHeight >
                                                                500
                                                            ? 400
                                                            : 370,
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
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                        fontSize: currentApplicationWidth >
                                                    400 &&
                                                currentApplicationHeight > 800
                                            ? 28
                                            : currentApplicationWidth > 340 &&
                                                    currentApplicationHeight >
                                                        700
                                                ? 23
                                                : currentApplicationWidth >
                                                            300 &&
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
                            //Signup
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 6.0, left: 15),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: currentApplicationWidth > 400 &&
                                            currentApplicationHeight > 800
                                        ? 25
                                        : currentApplicationWidth > 340 &&
                                                currentApplicationHeight > 700
                                            ? 22
                                            : currentApplicationWidth > 300 &&
                                                    currentApplicationHeight >
                                                        661
                                                ? 18
                                                : 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Space
                            const SizedBox(height: 20),
                            // Email
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Center(
                                child: SizedBox(
                                  width: currentApplicationWidth > 400
                                      ? 320
                                      : currentApplicationWidth > 340
                                          ? 300
                                          : currentApplicationWidth > 270
                                              ? 240
                                              : 200,
                                  height: 50,
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
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
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter an email address.';
                                      } else if (!_isValidEmail(value)) {
                                        return 'Please enter a valid email address.';
                                      }
                                      return null; // Return null if the validation passes.
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Space
                            const SizedBox(height: 20),
                            // Name
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Center(
                                child: SizedBox(
                                  width: currentApplicationWidth > 400
                                      ? 320
                                      : currentApplicationWidth > 340
                                          ? 300
                                          : currentApplicationWidth > 270
                                              ? 240
                                              : 200,
                                  height: 50,
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      //hintText: "Name",
                                      labelText: "Name",
                                      prefixIcon: const Icon(
                                        Icons.person,
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
                                          )),
                                    ),
                                    validator: (name) {
                                      if (name!.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Space
                            const SizedBox(height: 20),
                            // Age
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Center(
                                child: SizedBox(
                                  width: currentApplicationWidth > 400
                                      ? 320
                                      : currentApplicationWidth > 340
                                          ? 300
                                          : currentApplicationWidth > 270
                                              ? 240
                                              : 200,
                                  height: 50,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: ageController,
                                    decoration: InputDecoration(
                                        //hintText: "Age",
                                        labelText: "Age",
                                        prefixIcon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            )),
                                        // errorBorder: const OutlineInputBorder(
                                        //   borderSide: BorderSide(color: Colors.red),
                                        // ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ))),
                                    validator: (age) {
                                      if (age!.isEmpty) {
                                        return 'Please Enter Age';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Space
                            const SizedBox(height: 20),
                            // Password
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Center(
                                child: SizedBox(
                                  width: currentApplicationWidth > 400
                                      ? 320
                                      : currentApplicationWidth > 340
                                          ? 300
                                          : currentApplicationWidth > 270
                                              ? 240
                                              : 200,
                                  height: 50,
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
                                    validator: (password) {
                                      if (password!.isEmpty) {
                                        return 'Please Enter Password';
                                      } else if (password.length < 6) {
                                        return "Password must be at least 6 characters long.";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Space
                            const SizedBox(height: 10),
                            // Radio Button
                            Center(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio(
                                        activeColor: const Color(0xFF199ADD),
                                        value: "Male",
                                        groupValue: groupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                          fontSize: currentApplicationWidth >
                                                      400 &&
                                                  currentApplicationHeight > 800
                                              ? 15
                                              : currentApplicationWidth > 340 &&
                                                      currentApplicationHeight >
                                                          600
                                                  ? 12
                                                  : 10,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF7a7872),
                                        ),
                                      ),
                                      Radio(
                                          activeColor: const Color(0xFF199ADD),
                                          value: "Female",
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          }),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                          fontSize: currentApplicationWidth >
                                                      400 &&
                                                  currentApplicationHeight > 800
                                              ? 15
                                              : currentApplicationWidth > 340 &&
                                                      currentApplicationHeight >
                                                          600
                                                  ? 12
                                                  : 10,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF7a7872),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            // Space
                            const SizedBox(height: 20),
                            // Button of Signup
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  storeDataInFireBaseAuthAndFireBaseStore();
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
                                },
                                child: Container(
                                  width: currentApplicationWidth > 400
                                      ? 320
                                      : currentApplicationWidth > 340
                                          ? 300
                                          : currentApplicationWidth > 270
                                              ? 240
                                              : 200,
                                  height: 50,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: currentApplicationWidth >
                                                      400 &&
                                                  currentApplicationHeight > 800
                                              ? 15
                                              : currentApplicationWidth > 340 &&
                                                      currentApplicationHeight >
                                                          600
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
                                                    currentApplicationHeight >
                                                        600
                                                ? 12
                                                : 10,
                                      ),
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
                                "Already have an account",
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
                            // Login
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return _gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Center(
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: currentApplicationWidth >
                                                      400 &&
                                                  currentApplicationHeight > 800
                                              ? 20
                                              : currentApplicationWidth > 340 &&
                                                      currentApplicationHeight >
                                                          600
                                                  ? 18
                                                  : 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if(isLoading)
                      const Center(child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ))
                    ]),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  // String? _ValidateEmail(String? email) {
  //   // Simple email validation using a regular expression.
  //   RegExp regExpEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   final ValidEmail = regExpEmail.hasMatch(email ?? "");
  //   if(!ValidEmail)
  //     {
  //       return 'Please Enter Valid Email ';
  //     }
  //   return null;
  // }
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
  void endLoading()
  {
    setState(() {
      isLoading = false;
    });
  }

  Future<void> storeDataInFireBaseAuthAndFireBaseStore() async {
    bool chackEmailValid = _isValidEmail(emailController.text.trim());
    SessionController().userId = "";
    final firebaseAuthInstance = FirebaseAuth.instance;
    //_formKey.currentState!.validate();
    if (nameController.text.trim() != "" &&
        emailController.text.trim() != "" &&
        ageController.text.trim() != "" &&
        passwordController.text.trim() != "" &&
        groupValue.trim() != "") {
      if (passwordController.text.length > 5) {
        if (chackEmailValid == true) {
            if(RegExp(r'[a-zA-Z]').hasMatch(nameController.text.trim()))
              {
                try {
                  createLoading();
                  UserCredential userCredential =
                  await firebaseAuthInstance.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  if (userCredential != null) {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(userCredential.user!.uid)
                        .set({
                      "createdAt": DateTime.now(),
                      "Name": nameController.text.trim(),
                      "Email": emailController.text.trim(),
                      "Age": int.parse(ageController.text),
                      "Password": passwordController.text.trim(),
                      "Gender": groupValue.trim(),
                      "userId": firebaseAuthInstance.currentUser!.uid,
                      "ImageUrl": ""
                    });
                    endLoading();
                    DInfo.dialogSuccess(context, 'Register Successfully');
                    DInfo.closeDialog(context,
                        durationBeforeClose: const Duration(seconds: 3),
                        actionAfterClose: () {
                          firebaseAuthInstance.signOut().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          });
                        });
                  } else {
                    Fluttertoast.showToast(
                        msg:
                        "Unable to connect to the internet. Please check your network connection and try again.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 15.0);
                    endLoading();
                    //throw Exception();
                  }
                  // NameController.clear();
                  // EmailController.clear();
                  // AgeController.clear();
                  // PasswordController.clear();
                } catch (e) {
                  if (e is FirebaseException && e.code == 'failed-precondition') {
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
                    endLoading();
                  }
                  if (e is FirebaseException && e.code == 'network-request-failed') {
                    Fluttertoast.showToast(
                        msg:
                        "No internet connection. Please check your network settings.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 15.0);
                    endLoading();
                  }
                  if (e is FirebaseException && e.code == 'email-already-in-use') {
                    // User already exists, handle accordingly
                    Fluttertoast.showToast(
                        msg: "Email already in use. Try logging in instead.",
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
            else{
              Fluttertoast.showToast(
                  msg: "Name must be in alphabets",
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
              msg: "Email Pattern Incorrect",
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
          msg: "Please Fill the Each Field",
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
