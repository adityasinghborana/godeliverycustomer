import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/controllers/shopscontroller.dart';
import 'package:godelivery/data/Shopdata.dart';
import 'package:godelivery/view/utilities/constants.dart';
import 'package:godelivery/view/widgets/Shopliststack.dart';
import 'package:godelivery/view/widgets/filtersliderrestaurent.dart';

class restaurents extends StatelessWidget {
  String title;
  restaurents(this.title);
  final shops = Get.put(shopcontroller());
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "$title",
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
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemscat.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemfilter(
                    itemscat[index].itemnamee,
                    itemscat[index].iconurl,
                  );
                },
              )),
          Expanded(
              flex: 9,
              child: Obx(
                () => ListView.builder(
                  itemCount: shops.data.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Shoplist(
                      shops.data[index].imageurl,
                      shops.data[index].Sale,
                      shops.data[index].Time,
                      shops.data[index].Shopname,
                      shops.data[index].rating,
                      shops.data[index].ratingtypee,
                      shops.data[index].items,
                      shops.data[index].price,
                      shops.data[index].shopid,
                      // shops.Allshopdata2[index].distance,
                      // shops.Allshopdata2[index].isfavorite
                    );
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
