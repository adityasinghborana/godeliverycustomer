import 'package:flutter/material.dart';
import 'package:godelivery/models/categories.dart';

import '../../models/data/restaurentsdata.dart';
import '../../widgets/addressandcart.dart';
import '../../widgets/categorycard.dart';
import '../../widgets/Searchbar.dart';
import '../../widgets/Username.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Username(),
                Addresscart(),
                Searchbar(),
                Expanded(
                  //        <-- Use Expanded
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return categorycard(
                        context,
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
  }
}
