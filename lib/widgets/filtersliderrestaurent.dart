import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/controllers/shopcontroller.dart';
import 'package:godelivery/models/data/Shopdata.dart';

class itemfilter extends StatelessWidget {
  shopcontroller fil = Get.find();
  final String itemname;
  final String iconurl;

  itemfilter(this.itemname, this.iconurl);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 5),
      height: 80,
      width: MediaQuery.of(context).size.width * .20,
      // width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  fil.Filterdata(itemname);
                  print("${itemname}");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(
                    "$iconurl",
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 3,
                height: 5,
              ),
              Text("$itemname")
            ],
          ),
        ],
      ),
    );
  }
}
