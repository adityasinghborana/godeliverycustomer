//ignore_for_file: camel_case_types

import 'package:godelivery/models/products.dart';

class shopdata {
  final String shopid;
  final String Shopname;
  final String imageurl;
  final int rating;
  final double price;
  final double distance;
  final String Sale;
  final String Time;
  final int review;
  final String ratingtypee;
  final List items;
  final List<product> Products;
  bool isfavorite;
  shopdata({
    required this.shopid,
    required this.Shopname,
    required this.imageurl,
    required this.rating,
    required this.price,
    required this.distance,
    required this.Sale,
    required this.Time,
    required this.review,
    required this.ratingtypee,
    required this.items,
    required this.Products,
    this.isfavorite = false,
  });
}
