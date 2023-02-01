import 'package:get/get.dart';
import 'package:godelivery/models/data/Shopdata.dart';

import 'package:godelivery/models/resataurent.dart';

class shopcontroller extends GetxController {
  RxList Allshopdata2 = [].obs;
  RxList favshopdata = [].obs;
  late shopdata Shopdata;

  @override
  void onInit() {
    alldata();
    super.onInit();
  }

  void alldata() {
    Allshopdata2.value = Allshopdata;
  }

  Filterdata(String itemname) {
    Allshopdata2.value =
        Allshopdata.where((shopitem) => shopitem.items.contains(itemname))
            .toList();
  }

  void favdata() {}
}
