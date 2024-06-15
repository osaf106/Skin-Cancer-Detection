import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home Page/NavBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/ImageViewPage.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/ResultLoadingScreen/ResultWatingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //bool _loadingImage = false;
  //double progressLinearBar = 0.0;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  File? _image;
  bool isCamceraRequestSend = false;
  String? nameOfImageFileForImagePicker;
  String? typeOfImageFileForImagePicker;
  int? sizeOfImageFileForImagePicker;
  int? imageSizeKB;
  Timer? timer;

  Future cameraPermission() async {
    var cameraStatus = await Permission.camera.request();

    if (cameraStatus.isGranted) {
      _ImagePickerFromCamera();
    } else {
      Permission.camera.request();
      Fluttertoast.showToast(
          msg: "Required Camera Permission",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
    if(cameraStatus.isDenied)
      {
        Permission.camera.request();

      }
  }

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    double currentApplicationHeight = MediaQuery.of(context).size.height;
    const LinearGradient gradient = LinearGradient(
      colors: [
        Color(0xFF199ADD),
        Color(0xFF14BBD4),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Skin Guard Application",
          style: TextStyle(
              fontSize: currentApplicationWidth > 400
                  ? 20
                  : currentApplicationWidth > 360
                      ? 18
                      : currentApplicationWidth > 320
                          ? 16
                          : currentApplicationWidth > 290
                              ? 14
                              : 11,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(30),
              // bottomRight: Radius.circular(30),
              bottomLeft: Radius.elliptical(80, 30),
              bottomRight: Radius.elliptical(80, 30),
            ),
            gradient: LinearGradient(colors: [
              Color(0xFF199ADD),
              Color(0xFF14BBD4),
            ]),
          ),
        ),

        // Menu Button

        // leading: IconButton(
        //             onPressed: (){
        //
        //             },
        //             icon: Icon(Icons.menu, color: Colors.white,)
        // ),
        // actions: const [
        //         Icon(Icons.account_circle_outlined,
        //         color: Colors.white,
        //           size: 40,
        //         ),
        //
        // ],
      ),
      drawer: const NavBar(),
      body: Column(
        children: [
          //  Upload YOur Image
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Center(
                child: Text(
                  "Upload Your Image",
                  style: TextStyle(
                      fontSize: currentApplicationWidth > 390 &&
                              currentApplicationHeight > 600
                          ? 25
                          : currentApplicationWidth > 320 &&
                                  currentApplicationHeight > 500
                              ? 20
                              : 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          ),
          // File Type
          Text(
            "PNG, JPG, and other files are allowed",
            style: TextStyle(
              fontSize: currentApplicationWidth > 390 &&
                      currentApplicationHeight > 600
                  ? 15
                  : currentApplicationWidth > 320 &&
                          currentApplicationHeight > 500
                      ? 13
                      : 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6D6D6D),
            ),
          ),
          // Space
          const SizedBox(
            height: 30,
          ),
          // Take Image
          GestureDetector(
            onTap: () async {
              // cameraPermission();
              _ImagePickerFromCamera();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: currentApplicationHeight > 700
                          ? 145
                          : currentApplicationHeight > 600
                              ? 110
                              : currentApplicationHeight > 500
                                  ? 90
                                  : 70,
                      width: 350,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x40CACACA),
                            Color(0x40BEC8CF),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: currentApplicationHeight > 700
                                      ? 79
                                      : currentApplicationHeight > 600
                                          ? 60
                                          : currentApplicationHeight > 500
                                              ? 50
                                              : 40,
                                ),
                              )),
                          Text(
                            "Take a Picture",
                            style: TextStyle(
                                color: const Color(0xff6D6D6D),
                                fontSize: currentApplicationHeight > 700
                                    ? 14
                                    : currentApplicationHeight > 600
                                        ? 10
                                        : currentApplicationHeight > 500
                                            ? 9
                                            : 7,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Space
          const SizedBox(
            height: 20,
          ),
          // Upload Image
          GestureDetector(
            onTap: () async {
              // var galleryStatus = await Permission.photos.request();
              // if (galleryStatus.isGranted) {
              //   _ImagePickerFromGalery();
              // } else {
              //   Fluttertoast.showToast(
              //       msg: "Required Gallery Permission",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       backgroundColor: Colors.red,
              //       textColor: Colors.white,
              //       fontSize: 15.0);
              // }
              _ImagePickerFromGalery();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: currentApplicationHeight > 700
                          ? 145
                          : currentApplicationHeight > 600
                              ? 110
                              : currentApplicationHeight > 500
                                  ? 90
                                  : 70,
                      width: 350,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x40CACACA),
                            Color(0x40BEC8CF),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return gradient.createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Icon(
                                  Icons.cloud_upload,
                                  color: Colors.white,
                                  size: currentApplicationHeight > 700
                                      ? 79
                                      : currentApplicationHeight > 600
                                          ? 60
                                          : currentApplicationHeight > 500
                                              ? 50
                                              : 40,
                                ),
                              )),
                          Text(
                            "Browser to choose",
                            style: TextStyle(
                                color: const Color(0xff6D6D6D),
                                fontSize: currentApplicationHeight > 700
                                    ? 14
                                    : currentApplicationHeight > 600
                                        ? 10
                                        : currentApplicationHeight > 500
                                            ? 9
                                            : 7,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 3),
                          ),
                          Text(
                            "a Image",
                            style: TextStyle(
                                color: const Color(0xff6D6D6D),
                                fontSize: currentApplicationHeight > 700
                                    ? 14
                                    : currentApplicationHeight > 600
                                        ? 10
                                        : currentApplicationHeight > 500
                                            ? 9
                                            : 7,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _image != null
              ? SizedBox(
                  width: 375,
                  height: 100,
                  //margin: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageViewLoader(imageFile: _image!)));
                    },
                    child: Column(
                      children: [
                        //Container(margin: EdgeInsets.only(top: 1), child: Text("Done"),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Done",
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: currentApplicationWidth > 380
                                    ? 260
                                    : currentApplicationWidth > 340
                                        ? 232
                                        : currentApplicationWidth > 302
                                            ? 190
                                            : currentApplicationWidth > 270
                                                ? 160
                                                : 130,
                              ),
                              const Center(
                                  child: Text(
                                "Share",
                                textAlign: TextAlign.right,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Stack(children: [
                            SimpleAnimationProgressBar(
                              height: currentApplicationHeight > 700
                                  ? 60
                                  : currentApplicationHeight > 600
                                      ? 50
                                      : 40,
                              width: 350,
                              backgroundColor: Colors.white,
                              foregrondColor: const Color(0xFF199ADD),
                              ratio: 1,
                              direction: Axis.horizontal,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 15),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    3.0,
                                    3.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10.0,
                                    top: currentApplicationHeight > 700
                                        ? 15
                                        : currentApplicationHeight > 600
                                            ? 13
                                            : 10),
                                child: Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                  size: currentApplicationHeight > 700
                                      ? 30
                                      : currentApplicationHeight > 600
                                          ? 25
                                          : 20,
                                )),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _image = null;
                                  SessionController().image = null;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 270.0,
                                      top: currentApplicationHeight > 700
                                          ? 15
                                          : currentApplicationHeight > 600
                                              ? 13
                                              : 10),
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                    size: currentApplicationHeight > 700
                                        ? 30
                                        : currentApplicationHeight > 600
                                            ? 25
                                            : 20,
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _image != null
                                        ? SizedBox(
                                            width: 200,
                                            height: 40,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "$nameOfImageFileForImagePicker$typeOfImageFileForImagePicker",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          )
                                        : const Text(""),
                                  ],
                                ),
                                // _image != null
                                //     ? Align(
                                //         alignment: Alignment.center,
                                //         child: Text(
                                //           "${imageSizeKB}kb",
                                //           style: const TextStyle(
                                //               fontSize: 17,
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.w600),
                                //         ),
                                //       )
                                //     : const Text(""),
                              ],
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          // result Button
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (_image != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultWaitingScreen()));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                width: 350,
                height: currentApplicationHeight > 700
                    ? 60
                    : currentApplicationHeight > 600
                        ? 50
                        : 40,
                decoration: BoxDecoration(
                    gradient: _image != null
                        ? const LinearGradient(colors: [
                            Color(0xFF199ADD),
                            Color(0xFF14BAD5),
                          ])
                        : const LinearGradient(colors: [
                            Color(0xFFD9D9D9),
                            Color(0xFFD9D9D9),
                          ]),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text(
                  "See Result",
                  style: TextStyle(
                      fontSize: currentApplicationWidth > 370 &&
                              currentApplicationHeight > 70
                          ? 25
                          : currentApplicationWidth > 370 &&
                                  currentApplicationHeight > 70
                              ? 22
                              : 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          //Text(SessionController().userId.toString()),
          // firebaseAuth.currentUser!=null?
          //     StreamBuilder(
          //         stream: FirebaseFirestore.instance.collection("users").where("Email", isEqualTo: ).,
          //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
          //         {
          //           if(snapshot.hasError)
          //             {
          //               return Text("Have no data");
          //             }
          //           if(snapshot.connectionState == ConnectionState.waiting)
          //             {
          //               return CupertinoActivityIndicator();
          //             }
          //           if(snapshot.data!.docs.isEmpty)
          //             {
          //               return Text("Data not found");
          //             }
          //           return Container();
          //         }
          //     )
          // Container(
          //     width: 150,
          //     height: 150,
          //     color: Colors.white,
          //     child: _image == null
          //         ? Text("Image is not Selected")
          //         : Image.file(_image!)),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future _ImagePickerFromCamera() async {
    // setState(() {
    //   _loadingImage = true;
    //   progressLinearBar = 0.0;
    // });

    final returnCameraImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    // if (returnCameraImage != null) {
    //   for (double i = 0; i < 1; i++) {
    //     setState(() {
    //       progressLinearBar += i / 10;
    //     });
    //   }
    //   await Future.delayed(const Duration(seconds: 3));
    // }
    setState(() {
      _image = File(returnCameraImage!.path);
      SessionController().image = _image;
      nameOfImageFileForImagePicker = _image?.path.split('/').last;
      typeOfImageFileForImagePicker =
          nameOfImageFileForImagePicker?.split('.').last;
      //sizeOfImageFileForImagePicker = _image?.lengthSync();
    });
  }

  // ignore: non_constant_identifier_names
  Future _ImagePickerFromGalery() async {
    // setState(() {
    //   _loadingImage = true;
    //   progressLinearBar = 0.0;
    // });
    final returnGAlleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(returnGAlleryImage!.path);
      SessionController().image = _image;
      nameOfImageFileForImagePicker = _image?.path.split('/').last;
      typeOfImageFileForImagePicker =
          nameOfImageFileForImagePicker?.split('.').last;
      sizeOfImageFileForImagePicker = _image?.lengthSync();
      //imageSizeKB = (sizeOfImageFileForImagePicker! / 1024.0) as int?;
    });
    // if (returnGAlleryImage != null) {
    //   for (double i = 0; i < 1; i++) {
    //     setState(() {
    //       progressLinearBar = i ;
    //     });
    //   }
    //   await Future.delayed(const Duration(seconds: 3));
    // }
    // setState(() {
    //   _loadingImage = false;
    // });
  }
}
