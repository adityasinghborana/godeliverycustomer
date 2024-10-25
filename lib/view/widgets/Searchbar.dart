import 'package:flutter/material.dart';

Widget Searchbar() {
  TextEditingController _searchcontroller = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.center,
      height: 35,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xff979797)),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(fontSize: 12),
                  controller: _searchcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search by item name",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffBF1D2D),
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.tune_outlined,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    ),
  );
}
