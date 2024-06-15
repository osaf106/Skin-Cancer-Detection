import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  final LinearGradient _gradient = const LinearGradient(
    colors: [
      Color(0xFF199ADD),
      Color(0xFF14BBD4),
    ],
  );

  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double currentApplicationWidth = MediaQuery.of(context).size.width;
    double currentApplicationHeight = MediaQuery.of(context).size.height;
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
        child: SizedBox(
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
                    Icons.privacy_tip_outlined,
                    color: Colors.white,
                    size: 59,
                    weight: 35,
                  ),
                ),
                title: ShaderMask(
                  shaderCallback: (bounds) {
                    return _gradient.createShader(Rect.fromLTWH(
                        0, 0, bounds.width, bounds.height));
                  },
                  child: const Text(
                    "Privacy Policy",
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
                padding: const EdgeInsets.only(top: 7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        "This Privacy Policy outlines how we collect,"
                        " use, and safeguard your personal information "
                        "when you use our mobile application. By using "
                        "our app, you agree to the terms outlined in this policy."
                        " Our app is designed to provide Skin lesions Detection."
                        " We are committed to protecting your privacy and ensuring"
                        " the security of your personal information.",
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
                        "of your personal information as described therein. We only "
                        "collect this information with your consent and do not share it "
                        "with third parties without your permission.",
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
                        "Our app may allow you to upload or capture images"
                        " of health-related information, such as suspicious "
                        "skin lesions. We may use this information for the purpose"
                        " of analyzing and detecting potential health issues. We treat"
                        " this information with the utmost confidentiality and do not disclose"
                        " it to third parties without your explicit consent.",
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
                      padding: EdgeInsets.only(left: 22.0),
                      child: Text(
                        "1. Data Security:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff199ADD)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 23.0, right: 15),
                      child: Text(
                        "We take the security of your personal information"
                        " seriously and implement measures to protect it"
                        " from unauthorized access, disclosure, alteration, "
                        "or destruction. We use industry-standard encryption "
                        "techniques to secure data transmission and storage.",
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
                      padding: EdgeInsets.only(left: 22.0),
                      child: Text(
                        "2. Children's Privacy:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff199ADD)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 23.0, right: 15),
                      child: Text(
                        "Our app is not intended for use by children under"
                        " the age of 13. We do not knowingly collect personal"
                        " information from children under 13. If you are a parent "
                        "or guardian and believe that your child has provided us with "
                        "personal information, please contact us immediately, and we will"
                        " take steps to remove such information from our systems.",
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
                      padding: EdgeInsets.only(left: 22.0),
                      child: Text(
                        "3. Contact Us:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff199ADD)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 23.0, right: 15),
                      child: Text(
                        "If you have any questions or concerns about "
                        "our Privacy Policy or the handling of your "
                        "personal information,Please Contact us at: ",
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
      if (await canLaunchUrl(url as Uri)) {
        await launch(url);
      } else {
        // Can't launch email, show error message
      }
    } else {
      // Can't launch URL, show error message
      throw 'Could not launch $url';
    }
  }
}
