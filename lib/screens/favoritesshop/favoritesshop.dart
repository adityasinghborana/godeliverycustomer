// need to change it as it is hardcoded right now
import 'package:flutter/material.dart';
import 'package:godelivery/models/data/Shopdata.dart';
import 'package:godelivery/utilities/constants.dart';
import 'package:godelivery/widgets/Shopliststack.dart';
import 'package:godelivery/widgets/filtersliderrestaurent.dart';

class favoritesshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Favorites",
            style: TextStyle(color: colorblack),
          ),
          backgroundColor: Colors.white,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back_ios_new,
          //     color: colorblack,
          //   ), onPressed: () { return na },
          // ),
          actions: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.shopping_cart,
                color: colorblack,
              ),
            ),
          ]),
      body: Container(
        child: Column(children: [
          Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: Allshopdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Shoplist(
                      Allshopdata[index].imageurl,
                      Allshopdata[index].Sale,
                      Allshopdata[index].Time,
                      Allshopdata[index].Shopname,
                      Allshopdata[index].rating,
                      Allshopdata[index].ratingtypee,
                      Allshopdata[index].items);
                },
              )),
        ]),
      ),
    );
  }
}
