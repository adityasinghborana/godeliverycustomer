import 'package:flutter/material.dart';
import 'package:godelivery/models/categories.dart';
import 'package:godelivery/screens/grocery/grocery.dart';
import '../models/data/restaurentsdata.dart';
import '../screens/home/homescreen.dart';
import '../screens/home/homepage.dart';
import '../screens/restaurents.dart';

Widget categorycard(
  BuildContext context,
  String imagepath,
  String title,
  String Description,
  Color colors,
) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 05.0, horizontal: 3),
      child: Container(
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                child: ClipRRect(
                  child: Image.asset(
                    imagepath,
                    scale: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 2),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        child: Text(
                          Description,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Arial',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => grocery(title)),
                                )),
                            child: Row(
                              children: [
                                Text(
                                  "Explore",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Arial',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ));
}
