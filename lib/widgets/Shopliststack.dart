import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:godelivery/screens/shopdetail/productpage.dart';
import '../controllers/favorites.dart';
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
  Shoplist(this.url, this.sale, this.Time, this.name, this.rating,
      this.ratingtype, this.items, this.price);

  @override
  State<Shoplist> createState() => _ShoplistState();
}

class _ShoplistState extends State<Shoplist> {
  Icon icon = Icon(
    Icons.favorite_border_outlined,
    color: colorwhite,
  );

  Icon icon2 = Icon(
    Icons.favorite,
    color: colorPrimary,
  );

  bool click = true;

  void tap() {
    click = !click;
  }

  final fav4 = Get.put(favcontroller());

  @override
  Widget build(BuildContext context) {
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
                      builder: ((context) => Productpage(widget.name)))),
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
                        setState(() {
                          tap();
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 156, 156),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.only(
                              top: 5, right: 5, left: 5, bottom: 5),
                          child: (click == false) ? icon2 : icon),
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
                  Icon(
                    Icons.star,
                    color: colorAccent,
                    size: 14,
                  ),
                  Text(
                    "${widget.rating}",
                    style: TextStyle(
                        color: colorAccent,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.ratingtype,
                    style: TextStyle(
                        color: colorAccent,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
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

                      style: TextStyle(
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
                    style: TextStyle(
                        color: colorgreydark,
                        fontFamily: "arial",
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("Delivery",
                      style: TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: 4,
                  ),
                  Text("|",
                      style: TextStyle(
                          color: colorgreydark,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: 5,
                  ),
                  Text("2.4 miles away",
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
