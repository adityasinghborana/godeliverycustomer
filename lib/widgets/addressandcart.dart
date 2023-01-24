import 'package:flutter/material.dart';

Widget Addresscart() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "3891 Ranchview Dr. Richardso...",
        style: TextStyle(
            color: Color(0xff979797),
            fontFamily: 'arial',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ),
      Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: Icon(Icons.shopping_cart, color: Color(0xff979797)),
      ),
    ],
  );
}
