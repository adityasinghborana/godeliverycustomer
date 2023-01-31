import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:godelivery/models/data/Shopdata.dart';
import 'package:godelivery/models/resataurent.dart';

class favcontroller extends GetxController {
  RxList<shopdata> fav = <shopdata>[].obs;

  @override
  void onInit() {
    fetchproducts();
    super.onInit();
  }

  void fetchproducts() {
    var fav2 =
        Allshopdata.where((element) => element.isfavorite == true).toList();

    fav.value = fav2;
  }

  addfav(shopdata product) {
    fav.add(product);
  }
}
