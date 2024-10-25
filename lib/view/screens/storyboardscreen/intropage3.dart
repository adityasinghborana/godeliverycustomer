import 'package:flutter/material.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Image.asset(
                "assets/images/Group 14570.png",
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Text(
                  "Anything Anytime, Anywhere. We are           here to serve you ",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'opensans',
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
            Container(
              child: Image.asset(
                "assets/images/Group14821.png",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
