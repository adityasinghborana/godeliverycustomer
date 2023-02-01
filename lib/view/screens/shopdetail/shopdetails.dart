import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:godelivery/data/Shopdata.dart';
import 'package:godelivery/models/products.dart';
import 'package:godelivery/view/widgets/shopoverview.dart';

class shopdetail extends StatelessWidget {
  String shopid;
  shopdetail(this.shopid);

  @override
  Widget build(BuildContext context) {
    final go = Allshopdata.firstWhere((shop) => shop.shopid == shopid);
    return Scaffold(
      body: Shopdetails(
          shopid: go.shopid,
          Shopname: go.Shopname,
          imageurl: go.imageurl,
          rating: go.rating,
          price: go.price,
          distance: go.distance,
          Sale: go.Sale,
          Time: go.Time,
          review: go.review,
          ratingtypee: go.ratingtypee,
          items: go.items,
          Products: go.Products),
    );
  }
}
