import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    double currentApplicationHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, color: Color(0xFF14BDD4)),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: 15),
          child: ListView(
            children: const [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Text(
                          "Introduction:",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            wordSpacing: 2.0,
                            letterSpacing: 2.0,
                            color: Color(0xFF14BDD4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Text(
                          "The Skin Guard app signifies a groundbreaking leap"
                          " in healthcare technology, offering users a proactive "
                          "approach to skin health management. Seamlessly blending"
                          " the power of artificial intelligence with accessible user "
                          "interfaces, these apps revolutionize how individuals monitor"
                          " and assess potential skin lesions. By leveraging sophisticated"
                          " machine learning algorithms trained on vast datasets of "
                          "annotated skin images, these applications empower users to "
                          "upload or capture images of suspicious areas with ease. "
                          "Providing rapid and accurate assessments, the app becomes a"
                          " reliable companion in early detection efforts, alerting users"
                          " to potential risks and prompting timely medical consultation. "
                          "With user-centric design principles driving their development,"
                          " these apps prioritize simplicity, accessibility, and privacy,"
                          " ensuring that users can navigate seamlessly while maintaining "
                          "control over their personal health data. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            wordSpacing: 1.0,
                            letterSpacing: 1.0,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      // Image Capture
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          "Image Capture:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            wordSpacing: 0,
                            letterSpacing: 1.0,
                            color: Color(0xFF14BDD4),
                          ),
                        ),
                      ),
                      // Image Capture Body
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Text(
                          "The app allows users to capture "
                          "images of suspicious skin lesions using "
                          "their smartphone's camera. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            wordSpacing: 1.0,
                            letterSpacing: 1.0,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      // Image Upload
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          "Choose Browser:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            wordSpacing: 0,
                            letterSpacing: 1.0,
                            color: Color(0xFF14BDD4),
                          ),
                        ),
                      ),
                      // Image Upload Body
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Text(
                          "The app allows users to upload "
                          "images from Gallery of suspicious skin lesions using "
                          "their Choose from Browser. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            wordSpacing: 1.0,
                            letterSpacing: 1.0,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      // Result Button
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          "Analysis Result:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            wordSpacing: 0,
                            letterSpacing: 1.0,
                            color: Color(0xFF14BDD4),
                          ),
                        ),
                      ),
                      // Image Upload Body
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Text(
                          "The app allows users to press 'See Result' "
                          "receive Feedback of suspicious skin lesions.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            wordSpacing: 1.0,
                            letterSpacing: 1.0,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          "History:",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                            wordSpacing: 0,
                            letterSpacing: 1.0,
                            color: Color(0xFF14BDD4),
                          ),
                        ),
                      ),
                      // Image Upload Body
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Text(
                          "The app allows users to press 'History' "
                          "check the previous result history of suspicious skin lesions.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            wordSpacing: 1.0,
                            letterSpacing: 1.0,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
