import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermUse extends StatefulWidget {
  @override
  State<TermUse> createState() => _TermUseState();
}

class _TermUseState extends State<TermUse> {
  final LinearGradient _gradient = const LinearGradient(
    colors: [
      Color(0xFF199ADD),
      Color(0xFF14BBD4),
    ],
  );

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery
        .of(context)
        .size
        .width;
    double currentApplicationHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF199ADD),
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Container(
          width: double.infinity,
          height: 2000,
          child: ListView(
            children: [
              ListTile(
                  leading: ShaderMask(
                    shaderCallback: (bounds) {
                      return _gradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                    },
                    child: const Icon(
                      Icons.library_books_rounded,
                      color: Colors.white,
                      size: 63,
                      weight: 35,
                    ),
                  ),
                  title: ShaderMask(
                    shaderCallback: (bounds) {
                      return _gradient.createShader(Rect.fromLTWH(
                          0, 0, bounds.width, bounds.height));
                    },
                    child: const Text(
                      "Terms of use",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  subtitle:  const Text(
                    "Updated 10/02/2024",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff6D6D6D)),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "1 - Introduction",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff199ADD)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "Welcome to the Skin Guard Mobile App. "
                                "These Terms of Use govern your use of the App. By"
                                " accessing and using the App, you agree to be bound by "
                                "these Terms of Use. If you do not agree with any part of"
                                " these terms, please refrain from using the App.",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "2 - Personal Information",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff199ADD)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "You have to provide you with accurate "
                                "and personalized services, our app may collect"
                                " certain personal information, such as your name,"
                                " email ,age, and Gender. We are committed to "
                                "safeguarding your privacy and will only use this"
                                " information in accordance with our Privacy Policy. "
                                "By using our app, you consent to the collection and use "
                                "of your personal information as described therein.",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "3 - Image and Health Information",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff199ADD)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "When you upload or capture images of skin lesions using"
                                " our app, you understand and agree that this information"
                                " may be used for the purpose of skin cancer detection"
                                " and analysis. While we strive to maintain the confidentiality"
                                " and security of your health data, please be aware that no method"
                                " of transmission over the internet or electronic storage is "
                                "completely secure. By providing such information, "
                                "you acknowledge and accept the inherent risks associated "
                                "with data transmission and storage.",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "By using our Skin Guard App, you acknowledge"
                                " that the app is not a substitute for professional "
                                "medical advice, diagnosis, or treatment. The information"
                                " provided by the app is for informational purposes only "
                                "and should not be used as a basis for self-diagnosis or "
                                "self-treatment. Always consult a qualified healthcare "
                                "professional regarding any medical concerns or questions you may have.",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "If you have any questions or concerns about these"
                                " Terms of Use or our app's services,",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23.0, right: 15),
                          child: Text(
                            "Please Contact us at: ",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D6D6D)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _launchEmail("osafahmeds06@gmail.com");
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 23.0, right: 15),
                              child: Text(
                                "osafahmeds06@gmail.com",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff199ADD)),
                                textAlign: TextAlign.justify,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    final String url = _emailLaunchUri.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
