// ElevatedButton(
// onPressed: () {
// resetpassword(context);
// },
// child: Text("Send Link"),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color(0xffBF1D2D),
// ),
// ),
//
//
// ElevatedButton(
// onPressed: () async {
// final String signature =
// await SmsAutoFill().getAppSignature;
// print("Signature: $signature");
//
// starttimer();
// },
// child: Text("Verify"),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color(0xffBF1D2D),
// ),
// ),
//
// ElevatedButton(
// onPressed: () async {
// String number = _phonenumber.text;
// await authClass.verifyPhoneNumber(
// "${countryCode!.dialCode} ${_phonenumber.text}",
// context,
// setData);
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => otpscreen(
// "${countryCode!.dialCode} ${_phonenumber.text}"),
// ));
// print("$countryCode$number");
// },
// child: Text("Send OTP"),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color(0xffBF1D2D),
// ),
// ),
//
//
// ElevatedButton(
// onPressed: () async {
// try {
// firebase_auth.UserCredential usercredential =
// await firebaseAuth.signInWithEmailAndPassword(
// email: _emailController.text,
// password: _passwordController.text);
// await storage.write(
// key: "uid",
// value: usercredential.user?.uid,
// );
// print(usercredential.user?.uid);
//
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => HomePage()),
// (route) => false);
// } catch (e) {
// final snackbar = SnackBar(content: Text(e.toString()));
// ScaffoldMessenger.of(context).showSnackBar(snackbar);
// }
// },
// child: Text("Sign In"),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color(0xffBF1D2D),
// ),
// ),
//
// ElevatedButton(
// onPressed: () async {
// try {
// await firebaseAuth.createUserWithEmailAndPassword(
// email: _emailController.text,
// password: _passwordController.text);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => HomePage()),
// (route) => false);
// } catch (e) {
// final snackbar = SnackBar(content: Text(e.toString()));
// ScaffoldMessenger.of(context).showSnackBar(snackbar);
// }
// },
// child: Text("Sign Up"),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color(0xffBF1D2D),
// ),
// ),
//
//
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.all(15),
// alignment: Alignment.center,
// primary: color,
// ),
// onPressed: (() => setState(() {
// type = text;
// color = Colors.blue;
// })),
// child: Text("$text"),
// );
//
//
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Color(0xffBF1D2D),
// padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
// ),
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => SignupPage()),
// );
// },
// child: Text(
// "Get Started ",
// style: TextStyle(fontSize: 20),
// ),
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => HomePage()));
// },
// child: Text("Change",
// style: TextStyle(color: Color(0xffBF1D2D))),
// style: ElevatedButton.styleFrom(
// alignment: Alignment.center,
// primary: Color.fromARGB(255, 224, 224, 224),
// ),
// ),


import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color primaryColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final Alignment alignment;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.primaryColor = const Color(0xffBF1D2D),
    this.paddingHorizontal = 16.0,
    this.paddingVertical = 8.0,
    this.alignment = Alignment.center,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
        alignment: alignment,
      ),
      child: DefaultTextStyle(
        style: textStyle ?? const TextStyle(fontSize: 16),
        child: child,
      ),
    );
  }
}
