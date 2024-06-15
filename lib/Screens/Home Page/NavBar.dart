import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/ChangePassword/ChangePassword.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/DeleteAccount/DeleteAccount.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/History/History.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/HomePage.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/UserProfile/UserProfile.dart';
import 'package:skin_cancer_detection/Screens/Information/Privacy%20Policy/PrivacyPolicy.dart';
import 'package:skin_cancer_detection/Screens/Information/Term%20Use/TermUse.dart';
import 'package:skin_cancer_detection/Screens/Login/Login.dart';
import '../Information/Information.dart';
import 'package:permission_handler/permission_handler.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  final Color color = Colors.white;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // String GetNameData(){
  //   return "";
  // }
  // var Data =  GetNameData();
  final currentUser = FirebaseAuth.instance.currentUser;
  File? imageFile;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String imageUrl = '';
  bool isLoadingStart = true;
  bool expansionTileChanges = false;
  File? fireBaseImageFile;
  Timer? timer;

  DocumentReference userDoc = FirebaseFirestore.instance
      .collection("users")
      .doc(SessionController().userId);

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff199ADD),
          Color(0xff14BAD5),
        ])),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                // color: Color(0xFF199ADA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(100, 20),
                  bottomRight: Radius.elliptical(100, 20),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/skinvision-app-scanning-dark.jpg"),
                  // NetworkImage(
                  //     "https://www.digitalhealth.net/wp-content/uploads/2019/09/skinvision-app-scanning-dark.jpg"),
                  fit: BoxFit.cover,
                ), // Change this color as desired
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 15),
                    child: GestureDetector(
                      onTap: bottomSheet,
                      child: Container(
                        width: 122,
                        height: 122,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .where("userId", isEqualTo: currentUser?.uid)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/11591761.jpg",
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircleAvatar(
                                  child: ClipOval(
                                    child:  Center(
                                        child: CupertinoActivityIndicator(
                                      radius: 20,
                                      animating: true,
                                      color: Colors.red,
                                    )),
                                  ),
                                );
                              }
                              if (snapshot.data!.docs.isEmpty) {
                                return CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/11591761.jpg",
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.data != null) {
                                for (int i = 0;
                                    i < snapshot.data!.docs.length;) {
                                  var imageFileOfSnapshot = snapshot
                                      .data!.docs[i]["ImageUrl"]
                                      .toString();
                                  return CircleAvatar(
                                          child: ClipOval(
                                              child: imageFileOfSnapshot
                                                          .isNotEmpty ||
                                                      imageFile != null
                                                  ? Image.network(
                                                      imageFileOfSnapshot,
                                                      width: 120,
                                                      height: 120,
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                                                        if (loadingProgress == null) {
                                                          isLoadingStart = false;
                                                          return child;
                                                        } else {
                                                          return Center(
                                                            child: CircularProgressIndicator(
                                                              value: loadingProgress.expectedTotalBytes != null
                                                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                  : null,
                                                              backgroundColor: Colors.white,
                                                              color: Colors.blueAccent,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    )
                                                  : Image.asset(
                                                      "assets/images/11591761.jpg",
                                                      width: 120,
                                                      height: 120,
                                                      fit: BoxFit.cover,
                                                    )),
                                        );
                                }

                                // ListView.builder(
                                //   itemCount: snapshot.data!.docs.length,
                                //   itemBuilder: (context, index) {
                                //     return Align(
                                //       alignment: Alignment.bottomLeft,
                                //       child: Text(
                                //         snapshot.data!.docs[index]["Name"],
                                //         style: const TextStyle(
                                //             fontSize: 20, fontWeight: FontWeight.w400),
                                //       ),
                                //     );
                                //   });
                              }
                              return const Text("Nothing");
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 14),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .where("userId", isEqualTo: currentUser?.uid)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                            "Have no data",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator(
                            color: Colors.blueAccent,
                            radius: 10,
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                          return const Text(
                            "Data not found",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        if (snapshot.data != null) {
                          for (int i = 0; i < snapshot.data!.docs.length;) {
                            return Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                snapshot.data!.docs[i]["Name"],
                                style: TextStyle(
                                    fontSize:
                                        currentApplicationWidth > 400 ? 18 : 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            );
                          }

                          // ListView.builder(
                          //   itemCount: snapshot.data!.docs.length,
                          //   itemBuilder: (context, index) {
                          //     return Align(
                          //       alignment: Alignment.bottomLeft,
                          //       child: Text(
                          //         snapshot.data!.docs[index]["Name"],
                          //         style: const TextStyle(
                          //             fontSize: 20, fontWeight: FontWeight.w400),
                          //       ),
                          //     );
                          //   });
                        }
                        return const Text("Nothing");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .where("userId", isEqualTo: currentUser?.uid)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                            "Have no data",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator(
                            color: Colors.blueAccent,
                            radius: 10,
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                          return const Text(
                            "Data not found",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        if (snapshot.data != null) {
                          for (int i = 0; i < snapshot.data!.docs.length;) {
                            if(snapshot.data!.docs[i]["Email"]!= FirebaseAuth.instance.currentUser!.email.toString())
                            {
                              try {
                                DocumentReference documentReference =
                                FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
                                documentReference.update({
                                  "Email": FirebaseAuth.instance.currentUser!.email.toString(),
                                });
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg:
                                    "Server Error",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                              }
                            }
                            return Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                snapshot.data!.docs[i]["Email"],
                                style: TextStyle(
                                    fontSize:
                                        currentApplicationWidth > 400 ? 20 : 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            );
                          }

                          // ListView.builder(
                          //   itemCount: snapshot.data!.docs.length,
                          //   itemBuilder: (context, index) {
                          //     return Align(
                          //       alignment: Alignment.bottomLeft,
                          //       child: Text(
                          //         snapshot.data!.docs[index]["Name"],
                          //         style: const TextStyle(
                          //             fontSize: 20, fontWeight: FontWeight.w400),
                          //       ),
                          //     );
                          //   });
                        }
                        return const Text("Nothing");
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePageScreen()));
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "Information",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Information()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.library_books_sharp,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "Terms use",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermUse()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "History",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.launch_outlined,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "Legal Information",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Skin Guard",
                  applicationVersion: "0.1.0",
                  applicationLegalese: "Developed by Osaf Ahmad",
                  applicationIcon: Image.asset(
                    "assets/images/SkinGaurdLogo.jpeg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                trailing: expansionTileChanges == true
                    ? const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 30,
                      ),
                onExpansionChanged: (isExpanded) {
                  setState(() {
                    expansionTileChanges = !expansionTileChanges;
                  });
                },
                // backgroundColor: Color(0xff248fb4),
                // collapsedBackgroundColor: const Color(0xff248fb4),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: const Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserProfile()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.key_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: const Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePassword()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: const Text(
                        "Delete Accounts",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeleteAccount()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "Privacy Policy",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 25,
              ),
              title: const Text(
                "Log out",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onTap: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((value) {
                  SessionController().userId = "";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void fetchData() {
    FirebaseFirestore.instance
        .collection('users')
        .where("userId", isEqualTo: currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        SessionController().nameGet =
            doc["Name"]; // Access field "name" of each document
        SessionController().emailGet =
            doc["Email"]; // Access field "name" of each document
      }
    });
  }

  void bottomSheet() {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    // double currentApplicationHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bContext) {
          return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xff199ADD),
                    Color(0xff14BAD5),
                  ])),
              height: 120,
              width: currentApplicationWidth,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async{
                      // var cameraStatus = await Permission.camera.request();
                      // if (cameraStatus.isGranted) {
                      //   imageloadThroughCamera();
                      // } else {
                      //   Fluttertoast.showToast(
                      //       msg: "Required Camera Permission",
                      //       toastLength: Toast.LENGTH_LONG,
                      //       gravity: ToastGravity.BOTTOM,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 15.0);
                      // }
                      imageloadThroughCamera();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          color: Colors.white, // Border color
                          width: 1.0,
                        ),
                        // Border width
                      )),
                      width: currentApplicationWidth / 2,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 28.0),
                            child: Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      // var galleryStatus = await Permission.photos.request();
                      // if (galleryStatus.isGranted) {
                      //   imageloadThroughGallery();
                      // } else {
                      //   Fluttertoast.showToast(
                      //       msg: "Required gallery Permission",
                      //       toastLength: Toast.LENGTH_LONG,
                      //       gravity: ToastGravity.BOTTOM,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 15.0);
                      // }
                      imageloadThroughGallery();
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      width: currentApplicationWidth / 2,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  Future imageloadThroughCamera() async {
    final returnCameraImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(returnCameraImage!.path);
      storeImageOnFireBaseStorage();
    });
  }

  Future imageloadThroughGallery() async {
    final returnCameraImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(returnCameraImage!.path);
      storeImageOnFireBaseStorage();
    });
  }

  Future storeImageOnFireBaseStorage() async {
    setState(() {
      isLoadingStart = true;
    });
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(SessionController().userId)
            .get();
    if (userSnapshot.exists) {
      String haveAlreadyImage = userSnapshot.data()?['ImageUrl'];
      if (haveAlreadyImage.isNotEmpty) {
        FirebaseStorage.instance.refFromURL(haveAlreadyImage).delete();
      }
    }

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("images");

    // Create Reference of Image
    Reference referenceUploadImages = referenceDirImages.child(uniqueFileName);
    // Upload Image
    if (imageFile == null) {
      return;
    }
    try {
      await referenceUploadImages.putFile(imageFile!);
      // downloadURL
      imageUrl = await referenceUploadImages.getDownloadURL();
      Map<String, dynamic> data = {
        "ImageUrl": imageUrl,
      };

      userDoc.update(data).then((_) {
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => Fluttertoast.showToast(
          msg:
          "Fail to get URL",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0));
      //print(getImageUrl());
      setState(() {
        isLoadingStart = false;
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg:
          "Fail to Upload",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

// Future<String?> getImageUrl() async {
//   String currentUserId = SessionController().userId.toString();
//   DocumentSnapshot<Map<String, dynamic>> userSnapshot =
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUserId)
//           .get();
//   if (userSnapshot.exists) {
//     return userSnapshot.data()?['ImageUrl'];
//   }
//   return null;
// }
//
// Future<String?> getHistoryImageUrl() async {
//   String currentUserId = SessionController().userId.toString();
//   DocumentSnapshot<Map<String, dynamic>> userSnapshot =
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUserId)
//           .collection("History")
//           .doc()
//           .get();
//   if (userSnapshot.exists) {
//     return userSnapshot.data()?['HistoryImageUrl'];
//   }
//   return null;
// }
//
// Future<void> deleteHistoryImageUrl() async {
//   QuerySnapshot subCollectionSnapshot = await FirebaseFirestore.instance
//       .collection("users")
//       .doc(SessionController().userId)
//       .collection("History")
//       .get();
//   if (subCollectionSnapshot.docs.isNotEmpty) {
//     subCollectionSnapshot.docs.forEach((element) async {
//       await element.reference.delete();
//     });
//   }
//   // ignore: avoid_function_literals_in_foreach_calls
// }
}
