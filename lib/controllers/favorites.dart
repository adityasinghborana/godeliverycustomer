import 'package:get/get.dart';

import 'package:godelivery/data/Shopdata.dart';
import 'package:godelivery/models/shopcard.dart';

class favcontroller extends GetxController {
  RxList<shopdata> fav = <shopdata>[].obs;
  final RxBool favtap = true.obs;

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
}
