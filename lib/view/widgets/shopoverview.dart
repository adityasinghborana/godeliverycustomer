import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:godelivery/view/utilities/constants.dart';

import '../../models/products.dart';

class Shopdetails extends StatelessWidget {
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
  Shopdetails({
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height * .3,
          child: Stack(
            children: [
              Positioned(
                child: Image.network(
                  imageurl,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 5, left: 9, right: 2, bottom: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorgreydark,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: colorwhite,
                          )),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorgreydark,
                            ),
                            child: Icon(
                              Icons.search,
                              color: colorwhite,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorgreydark,
                            ),
                            child: Icon(
                              Icons.share,
                              color: colorwhite,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: colorPrimary),
                  child: Text(
                    Sale.toUpperCase(),
                    style: TextStyle(color: colorwhite),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 15,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: colorgreydark),
                  child: Icon(
                    Icons.favorite_border,
                    color: colorwhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
