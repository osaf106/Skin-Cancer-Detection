import 'dart:async';
// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/History/History.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/HomePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skin_cancer_detection/Screens/Information/Information.dart';
// import 'package:typewritertext/typewritertext.dart';
import 'package:overflow_text_animated/overflow_text_animated.dart';
import 'package:intl/intl.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  var currentData = DateTime.now();
  bool isSkinCancer = SessionController().isSkinCancer;
  User? currentUser = FirebaseAuth.instance.currentUser;
  String message = "";
  String alertMessage = "";
  IconData alertIcons = Icons.error;
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection("users")
      .doc(SessionController().userId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (isSkinCancer == true) {
      message = "See a dermatologist for a thorough evaluation."
          " Don't delay seeking medical attention.";
      alertMessage =
          "${SessionController().resultStoreForSkinCancer} Skin Cancer Detected";
      alertIcons = Icons.warning;
    } else {
      message = "Normal result to the Skin "
          "Cancer Detection Mobile App. These Terms of"
          " Use govern your use of the App.";
      alertMessage = 'No Detected Skin Cancer';
      alertIcons = Icons.verified_user;
    }
    setState(() {
      SessionController().resultStoreForSkinCancer="";
      addHistoryInFileBase();
    });
  }

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradient_ = LinearGradient(
      colors: [
        Color(0xFF199ADD),
        Color(0xFF14BBD4),
      ],
    );
    //isSkinCancer = false;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: GNav(
              backgroundColor: Colors.white,
              color: isSkinCancer == true
                  ? const Color(0xffF76969)
                  : const Color(0xff199ADD),
              activeColor: isSkinCancer == true
                  ? const Color(0xffF76969)
                  : const Color(0xff199ADD),
              gap: 6,
              tabBackgroundColor: isSkinCancer == true
                  ? const Color(0xCBC7C7FF)
                  : Colors.black12,
              iconSize: 20,
              duration: const Duration(milliseconds: 1000),
              onTabChange: (index) {
                if (index == 0) {
                  Timer(const Duration(seconds: 1), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePageScreen()));
                  });
                } else if (index == 1) {
                  Timer(const Duration(seconds: 1), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => History()));
                  });
                } else if (index == 2) {
                  Timer(const Duration(seconds: 1), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Information()));
                  });
                }
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.info_outline,
                  text: 'Information',
                ),
              ]),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: ShaderMask(
                  shaderCallback: (bounds) {
                    return gradient_.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                  },
                  child: const Text(
                    "Result",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
              subtitle: Text(
                "${currentData.day}/${currentData.month}/${currentData.year}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xB36D6D6D)),
              ),
              leading: const Icon(Icons.leaderboard_outlined,
                  color: Color(0xff14B9D4), size: 50),
            ),
            const SizedBox(
              height: 30,
            ),
            const OverflowTextAnimated(
              text: "Please Consult a doctor for accurate diagnosis.",
              style: TextStyle(
                fontSize: 23,
                color: Color(0xff6D6D6D),
                fontWeight: FontWeight.w400,
                wordSpacing: 3,
                letterSpacing: 3
              ),
              curve: Curves.fastOutSlowIn,
              animation: OverFlowTextAnimations.infiniteLoop,
              animateDuration: Duration(milliseconds: 300),
              delay: Duration(milliseconds: 100),
              loopSpace: 30,
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: 350,
              height: 350,
              child: Column(
                children: [
                  Icon(
                    alertIcons,
                    color: isSkinCancer == true
                        ? const Color(0xffF76969)
                        : const Color(0xff14B9D4),
                    size: 100,
                  ),
                  Center(
                    child: Text(
                      alertMessage,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isSkinCancer == true
                              ? const Color(0xffF76969)
                              : const Color(0xff199ADD)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6D6D6D)),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addHistoryInFileBase() async {
    // Day time convert into 12 hourse
    String formattedTime = DateFormat('hh:mm a').format(currentData);

    // Format the full date and time to 12-hour format with AM/PM
    String formattedDateTime = DateFormat('dd-MM-yyyy').format(currentData);
    String formattedTimeOnly = DateFormat(' hh:mm a').format(currentData);
    print(formattedDateTime);
    String historyImageURL = await storeImageOnFireBaseStorage();

    String document = documentReference.collection("History").doc().id;
    await documentReference.collection("History").add({
      "Date": formattedDateTime,
      "Time":formattedTimeOnly,
      "Message": message,
      "AlertMessage": alertMessage,
      "HistoryImageUrl": historyImageURL,
      "documentID": document,
      "TimeStemp": FieldValue.serverTimestamp(),
    });
  }

  Future<String> storeImageOnFireBaseStorage() async {
    Reference imageRoot = FirebaseStorage.instance.ref();
    Reference imageDirectory = imageRoot.child("HistoryImage");
    // Upload Image by ref
    Reference imageUploadReference = imageDirectory.child(uniqueFileName);

    try {
      UploadTask uploadTask =
          imageUploadReference.putFile(SessionController().image!);
      TaskSnapshot snapshot = await uploadTask;
      String imageURL = await snapshot.ref.getDownloadURL();
      // Map<String ,dynamic> dataUpdate = {
      //   "HistoryImageUrl": imageURL
      // };
      // documentReference.update(dataUpdate).then((value) => {
      //   print(imageURL),
      //   print(SessionController().userId),
      //
      // });
      SessionController().image = null;
      return imageURL;
    } catch (error) {
      print("error upload  ${error}");
    }
    return "";
  }
}
