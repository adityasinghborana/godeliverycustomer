import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home/homepage.dart';

class currentposition extends StatefulWidget {
  @override
  State<currentposition> createState() => _currentpositionState();
}

class _currentpositionState extends State<currentposition> {
  final LatLng currentlocation = LatLng(22.7196, 75.8577);
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _housecontroller = TextEditingController();
  TextEditingController _apartment = TextEditingController();
  TextEditingController _postalcode = TextEditingController();
  TextEditingController _Directiontoreach = TextEditingController();
  String type = "";
  Color color = Colors.grey;
  Widget Addresstype(bool tapped, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        primary: color,
      ),
      onPressed: (() => setState(() {
            type = text;
            color = Colors.blue;
          })),
      child: Text("$text"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: currentlocation,
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    }),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    formfields("House/Flat/Block No. ", _housecontroller,
                        TextInputType.text, 1),
                    formfields("Apartment/Road/Area", _apartment,
                        TextInputType.text, 1),
                    formfields(
                        "Postal Code ", _postalcode, TextInputType.text, 1),
                    formfields("Direction To reach ", _Directiontoreach,
                        TextInputType.multiline, 4),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("SAVE THIS ADDRESS AS"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Addresstype(true, "Work "),
                        Addresstype(true, "Home "),
                        Addresstype(true, "Others "),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 20,
                      child: ElevatedButton(
                        onPressed: () {
                          // print(_housecontroller.text);
                          // print(_apartment.text);
                          // print(_postalcode.text);
                          // print(_Directiontoreach.text);
                          // print(type);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text("Confirm"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          primary: Color(0xffBF1D2D),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget formfields(
    String texthint, TextEditingController con, TextInputType type, int lines) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: TextFormField(
      controller: con,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        hintText: texthint,
        border: InputBorder.none,
      ),
      obscureText: false,
      keyboardType: type,
      maxLines: lines,
    ),
  );
}
