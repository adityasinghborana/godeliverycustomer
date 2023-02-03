import 'package:get/get.dart';
import 'package:godelivery/data/Shopdata.dart';

class shopcontroller extends GetxController {
  RxList data = [].obs;

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
}
