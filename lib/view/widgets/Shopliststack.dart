import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/controllers/favorites.dart';
import 'package:godelivery/data/Shopdata.dart';

import 'package:godelivery/view/screens/shopdetail/shopdetails.dart';

import '../../controllers/shopscontroller.dart';
import '../utilities/constants.dart';

class Shoplist extends StatefulWidget {
  final String url;
  final String sale;
  final String Time;
  final String name;
  final int rating;
  final String ratingtype;
  final List items;
  final double price;
  final String shopid;

  Shoplist(
    this.url,
    this.sale,
    this.Time,
    this.name,
    this.rating,
    this.ratingtype,
    this.items,
    this.price,
    this.shopid,
  );

  @override
  State<Shoplist> createState() => _ShoplistState();
}

class _ShoplistState extends State<Shoplist> {
  var icon = Icon(
    Icons.favorite_border_outlined,
    color: colorwhite,
  ).obs;

  var icon2 = Icon(
    Icons.favorite,
    color: colorPrimary,
  ).obs;

  final filter = Get.put(shopcontroller());
  final fav = Get.put(favcontroller());

  @override
  Widget build(BuildContext context) {
    var index =
        Allshopdata.indexWhere((element) => element.shopid == widget.shopid);
    // Allshopdata[index].isfavorite = Allshopdata[index].isfavorite;

    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => shopdetail(widget.shopid))),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      "${widget.url}",
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, right: 25, left: 10, bottom: 5),
                      color: Colors.red,
                      child: Text(
                        widget.sale,
                        style: TextStyle(color: colorwhite),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        if (Allshopdata[index].isfavorite == false) {
                          fav.addtofav(widget.shopid, Allshopdata[index]);
                          icon.value = Icon(
                            Icons.favorite,
                            color: colorPrimary,
                          );
                          print("added");
                        } else {
                          fav.removefromfav(widget.shopid, Allshopdata[index]);
                          icon.value = Icon(
                            Icons.favorite_border_outlined,
                            color: colorwhite,
                          );
                          print("removed");
                        }
                        // fav.add(Allshopdata[found]);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 156, 156),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.only(
                              top: 5, right: 5, left: 5, bottom: 5),
                          child: Obx(
                            () => (Allshopdata[index].isfavorite == false)
                                ? icon.value
                                : icon2.value,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                            62,
                            123,
                            123,
                            123,
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top: 5, right: 50, left: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.Time,
                              style: TextStyle(color: colorwhite),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: colorblack,
                        fontFamily: "arial",
                        fontWeight: FontWeight.w700,
                        fontSize: FontSize.s14),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: colorAccent,
                    size: 14,
                  ),
                  Text(
                    "${widget.rating}",
                    style: const TextStyle(
                        color: colorAccent,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.ratingtype,
                    style: const TextStyle(
                        color: colorAccent,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      "  • " +
                          widget.items.first +
                          "  • " +
                          widget.items.elementAt(1) +
                          "  • " +
                          widget.items.elementAt(2),
                      //     .toString()
                      //     .replaceAll('[', '')
                      //     .replaceAll(']', '')
                      //     .replaceAll(',', '•') +
                      // ' '

                      style: const TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    "₦ ${widget.price}",
                    style: const TextStyle(
                        color: colorgreydark,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text("Delivery",
                      style: TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text("|",
                      style: TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("2.4 miles away",
                      style: TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
            Row(),
          ],
        ));
  }
}
