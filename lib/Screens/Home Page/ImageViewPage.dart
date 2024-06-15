import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'ResultLoadingScreen/ResultWatingScreen.dart';

// ignore: must_be_immutable
class ImageViewLoader extends StatefulWidget {
  File? imageFile;

  ImageViewLoader({super.key, this.imageFile});

  @override
  State<ImageViewLoader> createState() =>
      // ignore: no_logic_in_create_state
      _ImageViewLoaderState(imageFile: imageFile!);
}

class _ImageViewLoaderState extends State<ImageViewLoader> {
  File? imageFile;

  _ImageViewLoaderState({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  radius: const Radius.circular(12),
                  padding:const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 260,
                      width: 340,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(imageFile!), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (imageFile != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePageScreen()));
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)
                      ),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.blueAccent,
                      size: 36,
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ResultWaitingScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xFF199ADD),
                        Color(0xFF14BAD5),
                      ]),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Center(
                      child: Text(
                    "See Result",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
