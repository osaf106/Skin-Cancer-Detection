import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_info/d_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_detection/FireBaseControll/Login/ForgetPasswordFireBase.dart';
import 'package:skin_cancer_detection/Screens/Login/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  ForgetPasswordFireBase forgetPasswordFireBase = ForgetPasswordFireBase();

  @override
  Widget build(BuildContext context) {
    var currentApplicationWidth = MediaQuery.of(context).size.width;
    var currentApplicationHeight = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;
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
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 130.0, left: 15, right: 15),
                  child: Center(
                    child: Container(
                      width: currentApplicationWidth > 400
                          ? 400
                          : currentApplicationWidth > 340
                              ? 320
                              : 300,
                      height: currentApplicationHeight > 700
                          ? 420
                          : currentApplicationHeight > 650
                              ? 350
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
                          // Back
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: ShaderMask(
                              shaderCallback: (bounds) {
                                return gradient_.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: currentApplicationWidth > 400
                                        ? 24
                                        : currentApplicationWidth > 340
                                            ? 20
                                            : 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Welcome
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return gradient_.createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height));
                            },
                            child: Center(
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
                          ),
                          //Login
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return gradient_.createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 15),
                              child: Text(
                                "Forget Password",
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
                          const SizedBox(height: 40),
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
                          const SizedBox(height: 40),
                          // Button of Login
                          Center(
                            child: GestureDetector(
                              onTap: forgetPassword,
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
                                      "Reset Password",
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
                                                  currentApplicationHeight > 600
                                              ? 12
                                              : 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ))
              ],
            ),
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

  Future<void> forgetPassword() async {
    createLoading();
    try{
      if (emailController.text.trim().isNotEmpty) {
        if (_isValidEmail(emailController.text.trim()) == true) {
          FirebaseAuth auth = FirebaseAuth.instance;
            bool response = await forgetPasswordFireBase.ForgetUserPasswordFireBase(
                emailController.text.trim());
            if(response == true)
            {
              await Fluttertoast.showToast(
                  msg: "Forget Link send to your Mail",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              endLoading();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
            else
            {
              endLoading();
            }

        } else {
          await Fluttertoast.showToast(
              msg: "Email Pattern not Match",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          endLoading();
        }
      } else {
        await Fluttertoast.showToast(
            msg: "Please Fill the Email Field",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        endLoading();
      }
    }catch(e){
      print("OSaf Exp ${e}");
    }

  }
}
