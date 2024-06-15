import 'dart:async';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/HomePage.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/ResultLoadingScreen/ResultWatingScreen.dart';
import 'package:skin_cancer_detection/Screens/Login/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // timer for Log Active Application
    Timer(const Duration(seconds: 3), () {
      final currentUser = auth.currentUser;
      if (currentUser != null || SessionController().userId != null) {
        SessionController().userId = currentUser!.uid.toString();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePageScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF199ADD),
                  Color(0xFF14BBD4),
                ],
                begin: FractionalOffset(1.0, 1.0),
                end: FractionalOffset(0.0, 1.0)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tranform Text
              GradientAnimationText(
                text: Text(
                  'Skin Guard',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                colors: [
                  Colors.white,
                  Color(0xFF199ADD),
                  Colors.white10,
                ],
                duration: Duration(seconds: 5),
                transform: GradientRotation(math.pi / 4), // tranform
              ),
              GradientAnimationText(
                text: Text(
                  'Application',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                colors: [
                  Colors.white,
                  Color(0xFF199ADD),
                  Colors.white10,
                ],
                duration: Duration(seconds: 5),
                transform: GradientRotation(math.pi / 4), // tranform
              ),
              // Text(
              //   "Skin Cancer",
              //   style: TextStyle(
              //       fontSize: 36.0,
              //       color: Color(0xFFf9f8fd),
              //       fontWeight: FontWeight.w700),
              // ),
              // Text(
              //   "Detection",
              //   style: TextStyle(
              //       fontSize: 36.0,
              //       color: Color(0xFFf9f8fd),
              //       fontWeight: FontWeight.w700),
              // ),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
