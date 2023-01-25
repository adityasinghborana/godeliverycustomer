import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:godelivery/screens/Auth/signup.dart';

import 'package:godelivery/service/Authservice.dart';

class Profilepage extends StatelessWidget {
  AuthClass authClass = AuthClass();
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await authClass.signOut(context: context);
              await storage.delete(key: "uid");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                  (route) => false);
            },
            child: Text("Logout")),
      ),
    );
  }
}
