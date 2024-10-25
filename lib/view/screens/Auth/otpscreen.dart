import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:godelivery/view/screens/home/homepage.dart';
import 'package:sms_autofill/sms_autofill.dart';

class otpscreen extends StatefulWidget {
  final String phone;

  otpscreen(this.phone);
  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  String _verificationcode = "";

  @override
  int Start = 30;
  Color resend = Colors.red;

  void initState() {
    starttimer();
    _listenSmsCode();
    super.initState();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  void starttimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (Start == 0) {
        setState(() {
          timer.cancel();
          resend = Colors.red;
        });
      } else {
        setState(() {
          Start--;
          resend = Colors.black12;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpcontroller = TextEditingController();

    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("OTP Verification"),
                    Text("OTP sent to ${widget.phone}"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              // child: OTPTextField(
              //   onChanged: (value) => "hello",
              //   length: 6,
              //   fieldWidth: 50,
              //   style: TextStyle(fontSize: 17),
              //   textFieldAlignment: MainAxisAlignment.spaceAround,
              //   fieldStyle: FieldStyle.box,
              //   onCompleted: (pin) {
              //     print("Completed: " + pin);
              //   },
              child: PinFieldAutoFill(
                controller: _otpcontroller,
                codeLength: 6,
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                onCodeSubmitted: (code) async {
                  print("Completed: " + code);
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationcode, smsCode: code))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }
                  });
                },
                autoFocus: true,
                decoration: UnderlineDecoration(
                  lineHeight: 2,
                  lineStrokeCap: StrokeCap.square,
                  bgColorBuilder: PinListenColorBuilder(
                      Colors.green.shade200, Colors.grey.shade200),
                  colorBuilder: const FixedColorBuilder(Colors.transparent),
                ),
              ),
            ),
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
                    final String signature =
                        await SmsAutoFill().getAppSignature;
                    print("Signature: $signature");

                    starttimer();
                  },
                  child: Text("Verify"),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: Color(0xffBF1D2D),
                  ),
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Send OTP Again in",
                  style: TextStyle(color: Colors.black)),
              TextSpan(text: "$Start Sec", style: TextStyle(color: Colors.red)),
            ]),
          ),
          TextButton(
              onPressed: () {
                if (Start == 0) {
                  starttimer();
                  setState(() {
                    Start = 30;
                  });
                } else {
                  null;
                }
              },
              child: Text(
                "Resend",
                style: TextStyle(color: resend),
              ))
        ],
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      _verificationcode = verificationId;
    });
  }
}
