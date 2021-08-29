import 'dart:async';
import 'dart:math';
import 'package:evrekacase/modules/HomePage/MarkerModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  Set<Marker> markers = Set<Marker>();
  final CameraPosition basaksehir =
      CameraPosition(target: LatLng(41.096942, 28.779643), zoom: 16);
  BitmapDescriptor greenIcon;
  BitmapDescriptor yelloWIcon;
  BitmapDescriptor customIcon;
  DatabaseReference markersFirebase =
      FirebaseDatabase.instance.reference().child('markers');

  String containerDetailname = "";
  String containerDetailnext = "";
  String containerDetailfullness = "";
  double containerDetailLat = 0;
  double containerDetailLng = 0;
  bool isContainerDetailShow = false;
  bool isRelocationActive = false;
  bool isFirstOpen = false;
  double newMarkersLat;
  double newMarkersLng;

  @override
  void onInit() {
    customIconCreate();

    super.onInit();
  }

  customIconCreate() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(128, 128)), 'assets/Green.png')
        .then((d) {
      greenIcon = d;
      yellowIconCreate();
    });
  }

  yellowIconCreate() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(128, 128)), 'assets/Yellow.png')
        .then((d) {
      yelloWIcon = d;
      getMarkersFromFireBase();
    });
  }

  getMarkersFromFireBase() async {
    var snapshot = await markersFirebase.once();
    if (snapshot.value == null) {
      isFirstOpen = true;
    } else {
      var results = snapshot.value.values as Iterable;
      print(snapshot.value);
      for (var item in results) {
        double fullness = double.tryParse(item["fullness"]);
        if (fullness == null) {
          customIcon = greenIcon;
        } else {
          customIcon = yelloWIcon;
        }

        double lat = double.tryParse(item["lat"]);
        double lng = double.tryParse(item["lng"]);
        markers.add(Marker(
            position: LatLng(lat, lng),
            markerId: MarkerId(item["name"]),
            icon: customIcon,
            onTap: () => showContainerDetail(
                item["name"], item["next"], item["fullness"], lat, lng)));
      }
    }
    update();
  }

  showContainerDetail(
      String name, String next, String fullness, double lat, double lng) {
    containerDetailname = name;
    containerDetailnext = next;
    fullness == "null"
        ? containerDetailfullness = "0.0"
        : containerDetailfullness = fullness;
    containerDetailLat = lat;
    containerDetailLng = lng;
    isContainerDetailShow = true;
    update();
  }

  addNewMarker(LatLng value) {
    if (isRelocationActive) {
      newMarkersLat = value.latitude;
      newMarkersLng = value.longitude;
      markers.clear();
      markers.add(Marker(
        position: LatLng(value.latitude, value.longitude),
        markerId: MarkerId("newMarker"),
        icon: greenIcon,
      ));
      update();
    }
  }

  relocate() {
    isRelocationActive = true;
    isContainerDetailShow = false;
    markers.clear();
    update();
  }

  updateLocation() {
    isRelocationActive = false;
    isContainerDetailShow = false;
    markersFirebase.child(containerDetailname).update(
        {'lat': newMarkersLat.toString(), 'lng': newMarkersLng.toString()});
    Get.snackbar("Confirmed", "Your bin has been relocated successfully!");
    markers.clear();
    getMarkersFromFireBase();
    update();
  }

  createFireBaseDB() {
    var rnd = new Random();
    for (var i = 0; i < 10; i++) {
      double lt;
      double ln;
      double fullness;
      if (i % 2 == 0) {
        lt = 41.096942 + (rnd.nextDouble() / 100);
        ln = 28.779643 + (rnd.nextDouble() / 100);
        i > 50 ? fullness = (i / 50) : fullness = i.toDouble();
      } else {
        lt = 41.096942 - (rnd.nextDouble() / 100);
        ln = 28.779643 - (rnd.nextDouble() / 100);
        i > 50 ? fullness = (i / 50) : fullness = i.toDouble();
      }

      print(lt.toString() + "," + ln.toString());
      final marker = MarkerModel(
          name: "Container" + i.toString(),
          next: DateTime.now().add(Duration(days: i)).toString(),
          fullness: fullness.toString(),
          lat: lt.toString(),
          lng: ln.toString());
      markersFirebase.child("Container" + i.toString()).set(marker.toJson());
      isFirstOpen = false;
      getMarkersFromFireBase();
      update();
    }
  }
}
