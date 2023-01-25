import 'package:flutter/material.dart';
import '../screens/Auth/signup.dart';

class Intropage4 extends StatelessWidget {
  const Intropage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Image.asset(
                "assets/images/Group 14570-1.png",
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              child: Text("Browse the menu and order directly from us ",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'opensans',
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
            Container(
              child: Image.asset(
                "assets/images/Group 14777.png",
                height: MediaQuery.of(context).size.height / 4.5,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .17,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffBF1D2D),
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  "Get Started ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
