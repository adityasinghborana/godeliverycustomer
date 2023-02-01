import 'package:flutter/material.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Image.asset(
                "assets/images/Group 14570-2.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              child: Text(" Delivered to Your Door Enjoy your Groceries ",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'opensans',
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Image.asset(
                "assets/images/Group 14820.png",
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
