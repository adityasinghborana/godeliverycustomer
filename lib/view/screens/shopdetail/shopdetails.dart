import 'package:flutter/material.dart';
import '../../../data/Shopdata.dart';
import '../../widgets/shopoverviewstack.dart';

class shopdetail extends StatelessWidget {
  String shopid;
  shopdetail(this.shopid);

  @override
  Widget build(BuildContext context) {
    final data = Allshopdata.firstWhere((shop) => shop.shopid == shopid);
    return Scaffold(
      body: Shopdetailsstack(
          shopid: data.shopid,
          Shopname: data.Shopname,
          imageurl: data.imageurl,
          rating: data.rating,
          price: data.price,
          distance: data.distance,
          Sale: data.Sale,
          Time: data.Time,
          review: data.review,
          ratingtypee: data.ratingtypee,
          items: data.items,
          Products: data.Products),
    );
  }
}
