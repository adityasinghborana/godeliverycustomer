// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:godelivery/models/categories.dart';
// import 'package:godelivery/models/data/restaurentsdata.dart';
// import 'package:godelivery/models/filter.dart';
// import 'package:godelivery/utilities/constants.dart';
// import 'package:godelivery/widgets/Shopliststack.dart';
// import 'package:godelivery/widgets/filtersliderrestaurent.dart';

// import '../../models/data/grocerydata.dart';
// import '../../models/grocery.dart';
// import '../../models/resataurent.dart';

// class grocery extends StatefulWidget {
//   String title;
//   grocery(this.title);
//   @override
//   State<grocery> createState() => _groceryState();
// }

// class _groceryState extends State<grocery> {
//   var shop = shopdatagrocery;

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.black),
//           title: Text(
//             widget.title,
//             style: TextStyle(color: colorblack),
//           ),
//           backgroundColor: Colors.white,
//           // leading: IconButton(
//           //   icon: Icon(
//           //     Icons.arrow_back_ios_new,
//           //     color: colorblack,
//           //   ), onPressed: () { return na },
//           // ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Icon(
//                 Icons.shopping_cart,
//                 color: colorblack,
//               ),
//             ),
//           ]),
//       body: Container(
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: groitemscat.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return itemfilter(groitemscat[index].itemnamee,
//                         groitemscat[index].iconurl);
//                   },
//                 )),
//           ),
//           Expanded(
//               flex: 9,
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     // shop = shopdatagrocery;
//                   });
//                 },
//                 child: ListView.builder(
//                   itemCount: shop.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Shoplist(
//                         shop[index]["imageurl"],
//                         shop[index]["Sale"],
//                         shop[index]["Time"],
//                         shop[index]["Shopname"],
//                         shop[index]["rating"],
//                         shop[index]["ratingtypee"],
//                         shop[index]["items"]);
//                   },
//                 ),
//               )),
//         ]),
//       ),
//     );
//   }
// }
