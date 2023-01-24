import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:godelivery/models/categories.dart';
import 'package:godelivery/models/data/restaurentsdata.dart';
import 'package:godelivery/models/filter.dart';
import 'package:godelivery/utilities/constants.dart';
import 'package:godelivery/widgets/Shopliststack.dart';
import 'package:godelivery/widgets/filtersliderrestaurent.dart';

class grocery extends StatefulWidget {
  String title;
  grocery(this.title);
  @override
  State<grocery> createState() => _restaurentsState();
}

class _restaurentsState extends State<grocery> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            widget.title,
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
          Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemscat.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemfilter(
                      itemscat[index].itemnamee, itemscat[index].iconurl);
                },
              )),
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
