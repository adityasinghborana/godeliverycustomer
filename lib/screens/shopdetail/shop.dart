import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/controllers/shopcontroller.dart';
import 'package:godelivery/models/data/Shopdata.dart';
import 'package:godelivery/utilities/constants.dart';
import 'package:godelivery/widgets/Shopliststack.dart';
import 'package:godelivery/widgets/filtersliderrestaurent.dart';

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
                  itemCount: shops.Allshopdata2.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Shoplist(
                      shops.Allshopdata2[index].imageurl,
                      shops.Allshopdata2[index].Sale,
                      shops.Allshopdata2[index].Time,
                      shops.Allshopdata2[index].Shopname,
                      shops.Allshopdata2[index].rating,
                      shops.Allshopdata2[index].ratingtypee,
                      shops.Allshopdata2[index].items,
                      shops.Allshopdata2[index].price,
                    );
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
