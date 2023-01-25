import 'package:flutter/material.dart';

class Productpage extends StatelessWidget {
  String Title;
  Productpage(this.Title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(Title)),
      ),
    );
  }
}
