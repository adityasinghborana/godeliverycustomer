// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:godelivery/view/screens/Auth/otpscreen.dart';
import 'package:godelivery/data/service/Authservice.dart';
import 'package:godelivery/view/widgets/CustomElevatedButton.dart';

class Phoneauth extends StatefulWidget {
  @override
  State<Phoneauth> createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  TextEditingController _phonenumber = TextEditingController();
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  AuthClass authClass = AuthClass();
  String smsCode = "";
  String _verificationcode = "";

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      final code =
                          await countryPicker.showPicker(context: context);
                      if (code != null) {
                        setState(() {
                          countryCode = code;
                          print(countryCode);
                        });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: Color(0xff979797)),
                          borderRadius: BorderRadius.circular(5)),
                      child: countryCode != null
                          ? Row(
                              children: [
                                countryCode!.flagImage,
                                Icon(Icons.arrow_drop_down_rounded)
                              ],
                            )
                          : Icon(Icons.arrow_drop_down_rounded),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: .5, color: Color(0xff979797)),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          controller: _phonenumber,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            counterText: "",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: CustomElevatedButton(
                    onPressed: () async {
                      String number = _phonenumber.text;
                      await authClass.verifyPhoneNumber(
                          "${countryCode!.dialCode} ${_phonenumber.text}",
                          context,
                          setData);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => otpscreen(
                                "${countryCode!.dialCode} ${_phonenumber.text}"),
                          ));
                      print("$countryCode$number");
                    },
                    child: Text("Send OTP"),),),
          ],
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      _verificationcode = verificationId;
    });
  }
}
