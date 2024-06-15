import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import '../ResultScreen/ResultScreen.dart';

class ResultWaitingScreen extends StatefulWidget {
  const ResultWaitingScreen({super.key});

  @override
  State<ResultWaitingScreen> createState() => _ResultWaitingScreenState();
}

class _ResultWaitingScreenState extends State<ResultWaitingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  File? localModelPath;
  late List resultOfModel;

  void initState() {
    super.initState();
    //with TickerProviderStateMixin
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    initilizeModelAndResultGet();
    // Timer(const Duration(seconds: 5), (){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen()));
    // });
  }

  void dispose() {
    // Tflite.close();
    controller.dispose();
    super.dispose();
    Tflite.close();
  }

  Future initilizeModelAndResultGet() async {
    // model Load
    String? res = await Tflite.loadModel(
        model: "assets/SkinCancerDetectionTrainedModel.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        // defaults to 1
        isAsset: true,
        // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    print("Model Load : " + res!);
    // Model Result
    var recognitions = await Tflite.runModelOnImage(
        path: SessionController().image!.path,
        // required
        imageMean: 0.0,
        // defaults to 117.0
        imageStd: 255.0,
        // defaults to 1.0
        numResults: 2,
        // defaults to 5
        threshold: 0.2,
        // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      resultOfModel = recognitions!;
    });
    print("Result Of Model is " + resultOfModel.toString());
    //print(recognitions?[1]["label"].toString());

    if (resultOfModel.isNotEmpty) {
      if (recognitions!.length > 1) {
        SessionController().resultStoreForSkinCancer =
            recognitions[1]["label"].toString();
      } else if (recognitions.length > 2) {
        SessionController().resultStoreForSkinCancer =
            recognitions[2]["label"].toString();
      } else {
        SessionController().resultStoreForSkinCancer =
            recognitions[0]["label"].toString();
      }
      print(SessionController().resultStoreForSkinCancer);
      // response

      if (SessionController().resultStoreForSkinCancer!.isNotEmpty) {
        if (SessionController().resultStoreForSkinCancer == "Benign" ||
            SessionController().resultStoreForSkinCancer == "Malignant") {
          SessionController().isSkinCancer = true;
          Timer(const Duration(seconds: 5), () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const ResultScreen()));
          });
        } else {
          SessionController().resultStoreForSkinCancer = "";
          SessionController().isSkinCancer = false;
          Timer(const Duration(seconds: 5), () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const ResultScreen()));
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const LinearGradient _gradient = LinearGradient(
      colors: [
        Color(0xFF199ADD),
        Color(0xFF14BBD4),
      ],
    );
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              // Background image or widget
              Center(
                child: Image.asset(
                  "assets/images/blurImage.png",
                  fit: BoxFit.cover,
                ),
              ),
              // Blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black
                      .withOpacity(0), // Adjust the opacity as needed
                ),
              ),
              // Your content
              Center(
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "assets/images/XlO9.gif",
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
