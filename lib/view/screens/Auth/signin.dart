// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:godelivery/view/screens/Auth/forgotpassword.dart';
import 'package:godelivery/view/screens/home/homepage.dart';
import 'package:godelivery/view/screens/Auth/signup.dart';
import 'package:godelivery/data/service/Authservice.dart';
import 'package:godelivery/view/widgets/CustomElevatedButton.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthClass authClass = AuthClass();
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/Group41.png',
              fit: BoxFit.cover,
              scale: 2,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Sign in",
              style: TextStyle(
                  color: Color(0xff979797), fontFamily: "arial", fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonitem('assets/images/Group 1000004500.png'),
                  buttonitem('assets/images/Group 1000004496.png'),
                  buttonitem('assets/images/Group 1000004497.png'),
                  buttonitem('assets/images/Group 1000004499.png'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "OR",
                  style: TextStyle(
                      color: Color(0xff979797),
                      fontFamily: "arial",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: textitem("Email Address", false,
                  TextInputType.emailAddress, _emailController),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child: textitem("Password", true, TextInputType.visiblePassword,
                  _passwordController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgotpassword()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "arial",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                child:

                CustomElevatedButton(onPressed: () async {
        try {
          firebase_auth.UserCredential usercredential =
              await firebaseAuth.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
          await storage.write(
            key: "uid",
            value: usercredential.user?.uid,
          );
          print(usercredential.user?.uid);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }, child: Text("Sign In"))


              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                ),
                child: Text(
                  "Create new Account",
                  style: TextStyle(
                    fontFamily: "arial",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    color: Color(0xffBF1D2D),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonitem(String imagepath) {
    return InkWell(
      onTap: (() {
        authClass.googleSignIn(context);
      }),
      child: Card(
        elevation: 0,
        child: Image.asset(
          imagepath,
        ),
      ),
    );
  }

  Widget textitem(String placeholder, bool hidden, TextInputType inputtype,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xff979797)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Color(0xff979797)),
            hintText: placeholder,
            border: InputBorder.none,
          ),
          obscureText: hidden,
          keyboardType: inputtype,
        ),
      ),
    );
  }
}
