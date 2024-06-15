import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skin_cancer_detection/Screens/Splash/SplashScreen.dart';
import 'firebase_options.dart';
//Future
Future main() async{
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //     options: const FirebaseOptions(
    //         apiKey: "AIzaSyAKQZRIm5yTXIIUo0h7AhHF7ogvjG9YAj4",
    //         appId: "1:302165367615:android:9462d7353e4e4d54f4d18a",
    //         messagingSenderId:"302165367615",
    //         projectId: "skin-cancer-detection-c3bd5"
    //     ),
    //     name: "Skin Cancer Detection"
    // );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Cancer Detection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 50
        )
      ),
      darkTheme: ThemeData(),
      color: Colors.white,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Title"),
      ),
      body: Container(


      ),

    );
  }
}
