// need to change it as it is hardcoded right now
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/controllers/favorites.dart';
import 'package:godelivery/utilities/constants.dart';
import 'package:godelivery/widgets/Shopliststack.dart';

class favoritesshop extends StatelessWidget {
  final fav1 = Get.put(favcontroller());

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
              child: Obx(
                () => ListView.builder(
                  itemCount: fav1.fav.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (fav1.fav == null)
                        ? Text("nodata")
                        : Shoplist(
                            fav1.fav[index].imageurl,
                            fav1.fav[index].Sale,
                            fav1.fav[index].Time,
                            fav1.fav[index].Shopname,
                            fav1.fav[index].rating,
                            fav1.fav[index].ratingtypee,
                            fav1.fav[index].items,
                            fav1.fav[index].price);
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
