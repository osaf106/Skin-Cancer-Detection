import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_detection/FireBaseControll/SessionController/SesstionController.dart';
import 'package:skin_cancer_detection/Screens/Home%20Page/HomePage.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var currentData = DateTime.now();
  User? currentUser = FirebaseAuth.instance.currentUser;
  File? image = SessionController().image;
  String currentDocID = "";
  bool isLoadingStart =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradient_ = LinearGradient(
      colors: [
        Color(0xFF199ADD),
        Color(0xFF14BBD4),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageScreen()));
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Color(0xff14BDD4),
            )),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.account_tree_outlined,
                color: Color(0xff14BDD4),
                size: 50,
              ),
              title: ShaderMask(
                shaderCallback: (bounds) {
                  return gradient_.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                },
                child: const Text(
                  "Listing",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              subtitle: Text(
                " ${currentData.day}/${currentData.month}/${currentData.year}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xB36D6D6D)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(currentUser?.uid)
                    .collection("History")
                    .orderBy('TimeStemp', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.36,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 28.0),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  width: 380,
                                  height: 450,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF8F9FD),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xff14B9D4)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: PopupMenuButton(
                                          icon: const Icon(
                                            Icons.more_vert,
                                            color: Color(0xff14BDD4),
                                          ),
                                          offset: const Offset(0, 40),
                                          onSelected: (value) async {
                                            // Handle menu item selection
                                            if (value == "Delete") {
                                              await FirebaseFirestore.instance
                                                  .collection("users")
                                                  .doc(SessionController()
                                                      .userId)
                                                  .collection("History")
                                                  .doc(snapshot
                                                      .data!.docs[index].id)
                                                  .delete();
                                              FirebaseStorage.instance
                                                  .refFromURL(
                                                      snapshot.data!.docs[index]
                                                          ["HistoryImageUrl"])
                                                  .delete();
                                            }
                                          },
                                          enabled: true,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          itemBuilder: (context) => [
                                            const PopupMenuItem(
                                                value: "Delete",
                                                child: ListTile(
                                                  leading: Icon(Icons.delete,
                                                      color: Color(0xff14BDD4)),
                                                  title: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      color: Color(0xff14BDD4),
                                                    ),
                                                  ),
                                                )),
                                            // const PopupMenuItem(
                                            //     value: "Cancel",
                                            //     child: ListTile(
                                            //       leading: Icon(Icons.cancel_outlined,
                                            //           color: Color(0xff14BDD4)),
                                            //       title: Text(
                                            //         "Cancel",
                                            //         style: TextStyle(
                                            //           color: Color(0xff14BDD4),
                                            //         ),
                                            //       ),
                                            //     )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, right: 10, left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Time: ${snapshot.data!.docs[index]["Time"]}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xB36D6D6D)),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                "Date: ${snapshot.data!.docs[index]["Date"]}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xB36D6D6D)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 18.0, top: 10),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 300,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              //shape: BoxShape.circle,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                width: 2,
                                                color: const Color(0xff47AEE4),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                )
                                              ],
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  snapshot.data!.docs[index]
                                                  ["HistoryImageUrl"],
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                            ),
                                            child:
                                            Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Image.network(
                                                    snapshot.data!.docs[index]
                                                    ["HistoryImageUrl"],
                                                    width: 120,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return Text("");
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          "Result",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                              color: Color(0xff47AEE4)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "${snapshot.data!.docs[index]["AlertMessage"]}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff47AEE4)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.docs[index]["Message"]}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xB36D6D6D)),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.hasError.toString());
                    }
                  } else {
                    return const Center(
                        child: CupertinoActivityIndicator(
                      radius: 20,
                      animating: true,
                      color: Colors.red,
                    ));
                  }
                  return const Center(child: Text("History not Found "));
                }),
          ],
        ),
      ),
    );
  }
}
