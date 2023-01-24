import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class store {
  final String imagepath;
  final String Storename;
  final double rating;
  final String menutype1;
  final String menutype2;
  final String menutype3;
  final String menutype4;
  final int price;
  final String Delivery;
  final double miles;
  final int time;
  var discount;

  store(
      this.imagepath,
      this.Storename,
      this.rating,
      this.menutype1,
      this.menutype2,
      this.menutype3,
      this.menutype4,
      this.price,
      this.Delivery,
      this.miles,
      this.time,
      this.discount);
}
