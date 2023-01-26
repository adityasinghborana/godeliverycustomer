import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/data/Shopdata.dart';
import '../../widgets/addressandcart.dart';
import '../../widgets/categorycard.dart';
import '../../widgets/Searchbar.dart';
import '../../widgets/Username.dart';

class Homescreen extends StatelessWidget {
  List<String>? usernames =
      FirebaseAuth.instance.currentUser?.email?.split('@');

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isIOS || GetPlatform.isAndroid) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: [
                  Username("${usernames?[0].toUpperCase()}"),
                  Addresscart(),
                  Searchbar(),
                  Expanded(
                    //        <-- Use Expanded
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return categorycard(
                          categories[index]["imagepath"],
                          categories[index]["title"],
                          categories[index]["description"],
                          categories[index]["color"],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Username("${usernames?[0].toUpperCase()}"),
                Addresscart(),
                Searchbar(),
                Expanded(
                  //        <-- Use Expanded
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return categorycard(
                        categories[index]["imagepath"],
                        categories[index]["title"],
                        categories[index]["description"],
                        categories[index]["color"],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
