import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:godelivery/screens/Auth/signin.dart';
import 'package:godelivery/screens/address.dart';

import 'package:godelivery/screens/home/homepage.dart';
import 'package:godelivery/screens/map.dart';
import 'package:godelivery/screens/Auth/otpscreen.dart';
import 'package:godelivery/screens/restaurents.dart';

import 'package:godelivery/service/Authservice.dart';

import 'storyboardscreen/storyboard.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  Widget currentPage = SigninPage();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    checklogin();
    super.initState();
  }

  void checklogin() async {
    String? token = await authClass.getToken();
    String? uida = await authClass.getuid();
    if (token != null || uida != null) {
      setState(() {
        print(token);

        print("$uida hello");
        currentPage = HomePage(); // chage it to home page
      });
    } else {
      print("hii");
      currentPage = StoryBoard(); //
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentPage,
    );
  }
}
