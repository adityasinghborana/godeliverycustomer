import 'dart:async';
import 'package:flutter/material.dart';
import 'package:godelivery/view/screens/address.dart';
import 'package:godelivery/view/screens/home/homepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final LatLng currentlocation = LatLng(22.7196, 75.8577);
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            // height: MediaQuery.of(context).size.height * .70,
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
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [Text("Select delivery location")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text("marker"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Current location ")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Text("Change",
                                  style: TextStyle(color: Color(0xffBF1D2D))),
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                primary: Color.fromARGB(255, 224, 224, 224),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [Text("25 A greter brijeshwari indore ")]),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width - 16,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            currentposition()));
                              },
                              child: Text("Confirm Loction"),
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                primary: Color(0xffBF1D2D),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
