import 'package:get/get.dart';
import 'package:godelivery/data/Shopdata.dart';

import 'package:godelivery/models/shopcard.dart';

class shopcontroller extends GetxController {
  RxList data = [].obs;
  final RxBool favtap = true.obs;

  @override
  void onInit() {
    allshopdata();
    super.onInit();
  }

  void allshopdata() {
    data.value = Allshopdata;
  }

  Filterdata(String itemname) {
    data.value =
        Allshopdata.where((shopitem) => shopitem.items.contains(itemname))
            .toList();
  }

  favtouch() {
    favtap.value = !favtap.value;
    print(favtap.value);
  }
}
