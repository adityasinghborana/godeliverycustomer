import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:godelivery/screens/Auth/signin.dart';
import 'package:godelivery/screens/home/homepage.dart';
import 'package:godelivery/screens/Auth/phoneauth.dart';
import 'package:godelivery/service/Authservice.dart';

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  bool value = false;
  bool _checkbox = false;
  bool _checkbox2 = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthClass authClass = AuthClass();

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
              "Sign Up",
              style: TextStyle(
                  color: Color(0xff979797), fontFamily: "arial", fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Phoneauth(),
                      ),
                    ),
                    child: Card(
                      elevation: 0,
                      child: Image.asset(
                        'assets/images/Group 1000004500.png',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      authClass.googleSignIn(context);
                    },
                    child: Card(
                      elevation: 0,
                      child: Image.asset(
                        'assets/images/Group 1000004496.png',
                      ),
                    ),
                  ),
                  buttonitem('assets/images/Group 1000004497.png', () async {
                    authClass.googleSignIn(context);
                  }),
                  buttonitem('assets/images/Group 1000004499.png', () async {
                    authClass.googleSignIn(context);
                  }),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                child: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await firebaseAuth.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      } catch (e) {
                        final snackbar = SnackBar(content: Text(e.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      primary: Color(0xffBF1D2D),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPage()),
                ),
                child: Text(
                  "Already Have a Account ? Login",
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
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'By proceeding, you agree to our',
                  style: TextStyle(color: Colors.black, fontSize: 11),
                  children: const <TextSpan>[
                    TextSpan(
                        text: ' Terms of Use & Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0EACD7))),
                  ],
                ),
              ),
            ),
            checkboxs(
                "I agree to receive information and news from Go Deliveree via email. You can unsubscribe anytime. in your personal settings"),
            checkbox2(
                "I agree that Go Deliveree may contact me for customer surveys via the telephone number I have provided. You can unsubscribe anytime in your personal settings"),
          ],
        ),
      ),
    );
  }

  Widget buttonitem(String imagepath, Function ontap) {
    return InkWell(
      onTap: () async {
        ontap;
      },
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

  Widget checkboxs(String description) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          description,
          style: TextStyle(
              fontFamily: 'arial', fontSize: 14, fontWeight: FontWeight.w400),
        ),
        value: _checkbox,
        onChanged: (value) {
          setState(() {
            _checkbox = !_checkbox;
          });
        },
      ),
    );
  }

  Widget checkbox2(String description) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          description,
          style: TextStyle(
              fontFamily: 'arial', fontSize: 14, fontWeight: FontWeight.w400),
        ),
        value: _checkbox2,
        onChanged: (value) {
          setState(() {
            _checkbox2 = !_checkbox2;
          });
        },
      ),
    );
  }
}
