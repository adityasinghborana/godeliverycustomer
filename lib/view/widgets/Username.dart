import 'package:flutter/material.dart';

Widget Username(String username) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.location_on_outlined,
        color: Color(0xffBF1D2D),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Text(
          "${username}",
          style: TextStyle(
              fontFamily: 'arial',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
      )
    ],
  );
}
