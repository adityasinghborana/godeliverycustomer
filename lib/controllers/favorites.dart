import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:godelivery/data/Shopdata.dart';
import 'package:godelivery/models/shopcard.dart';

class favcontroller extends GetxController {
  var fav = [].obs;

  @override
  void onInit() {
    fetchproducts();
    super.onInit();
  }

  void fetchproducts() {
    var allfav =
        Allshopdata.where((element) => element.isfavorite == true).toList();

    fav.value = allfav;
  }

  addtofav(id, shopdata item) {
    var index = Allshopdata.indexWhere((element) => element.shopid == id);
    Allshopdata[index].isfavorite = !Allshopdata[index].isfavorite;
    fav.add(item);
  }

  removefromfav(id, shopdata item) {
    var index = Allshopdata.indexWhere((element) => element.shopid == id);
    Allshopdata[index].isfavorite = !Allshopdata[index].isfavorite;
    fav.remove(item);
  }

  // add(shopdata item) {
  //   fav.add(item);
  // }
}
