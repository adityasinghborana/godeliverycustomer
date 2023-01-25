import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:godelivery/models/data/restaurentsdata.dart';
import 'package:godelivery/screens/productpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/resataurent.dart';
import '../utilities/constants.dart';

class Shoplist extends StatefulWidget {
  final String url;
  final String sale;
  final String Time;
  final String name;
  final int rating;
  final String ratingtype;
  final List items;
  Shoplist(this.url, this.sale, this.Time, this.name, this.rating,
      this.ratingtype, this.items);

  @override
  State<Shoplist> createState() => _ShoplistState();
}

class _ShoplistState extends State<Shoplist> {
  Icon icon = Icon(
    Icons.favorite_border_outlined,
    color: colorwhite,
  );
  Icon icon2 = Icon(Icons.favorite);
  bool click = true;
  void tap() {
    click = !click;
  }

  @override
  Widget build(BuildContext context) {
    //Icon heart = Icon(Icons.favorite);
    // Icon filledheart = Icon(Icons.favorite_border_outlined);
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
                      widget.url,
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
                          icon = Icon(
                            Icons.favorite,
                            color: colorPrimary,
                          );
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 156, 156),
                              borderRadius: BorderRadius.circular(40)),
                          padding: EdgeInsets.only(
                              top: 5, right: 5, left: 5, bottom: 5),
                          child: icon),
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
                  Container(
                    child: Icon(
                      Icons.star,
                      color: colorAccent,
                      size: 14,
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.rating}",
                      style: TextStyle(
                          color: colorAccent,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      widget.ratingtype,
                      style: TextStyle(
                          color: colorAccent,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      widget.items.toString(),
                      style: TextStyle(
                          color: colorblack,
                          fontFamily: "arial",
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
            Row(),
            Row(),
          ],
        ));
  }
}
