import 'package:evrekacase/modules/GlobalWidgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../helper.dart';
import 'HomePageController.dart';

class HomePageScreen extends StatelessWidget {
  final HomePageController c = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<HomePageController>(
              init: HomePageController(),
              builder: (_) {
                return GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    c.controller.complete(controller);
                  },
                  markers: c.markers,
                  myLocationEnabled: true,
                  initialCameraPosition: c.basaksehir,
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  onLongPress: (value) {
                    c.addNewMarker(value);
                  },
                );
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: GetBuilder<HomePageController>(
                  init: HomePageController(),
                  builder: (_) {
                    if (c.isContainerDetailShow) {
                      return mapDialog(
                          context,
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.only(left: 12),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(c.containerDetailname, style: h3()),
                                      Text(
                                        "Next Collection",
                                        style: h4(),
                                      ),
                                      Text(
                                        c.containerDetailnext,
                                        style: t1(),
                                      ),
                                      Text(
                                        "Fullness Rate",
                                        style: h4(),
                                      ),
                                      Text(
                                        c.containerDetailfullness + "%",
                                        style: t1(),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          greenButton("NAVIGATE", 1, () {
                                            MapsLauncher.launchCoordinates(
                                                c.containerDetailLat,
                                                c.containerDetailLng,
                                                c.containerDetailname);
                                          }),
                                          greenButton("RELOCATE", 1, () {
                                            //c.createFireBaseDB();
                                            c.relocate();
                                          }),
                                        ],
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          c.isContainerDetailShow = false;
                                          c.update();
                                        },
                                        icon: Icon(Icons.close)),
                                  )
                                ],
                              )));
                    } else if (c.isRelocationActive) {
                      return mapDialog(
                          context,
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Please select a location from the map for your bin to be relocated. You can select a location by long press on the map.",
                                    style: t1(),
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  greenButton("SAVE", 1, () {
                                    c.updateLocation();
                                  }),
                                ],
                              )));
                    } else if (c.isFirstOpen) {
                      return mapDialog(
                          context,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.only(left: 12),
                            child: Column(
                              children: [
                                Text(
                                  "We will generate 1000 points close to your location. This dialog will no longer appear.",
                                  style: t1(),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                greenButton("GENERATE", 1, () {
                                  c.createFireBaseDB();
                                }),
                              ],
                            ),
                          ));
                    } else if (c.isLoading) {
                      return Container(
                        width: screenW(0.3, context),
                        height: screenW(0.3, context),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })),
        ],
      ),
    );
  }

  Container mapDialog(BuildContext context, Widget wd) {
    return Container(
        width: screenW(0.9, context),
        height: screenH(0.33, context),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: LightColor,
          boxShadow: [
            BoxShadow(
              color: ShadowColor,
              spreadRadius: 1.5,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 8, right: 8),
        child: wd);
  }
}
