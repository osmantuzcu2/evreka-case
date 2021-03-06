import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'marker_model.dart';

class HomePageController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  Set<Marker> markers = <Marker>{};
  final CameraPosition basaksehir =
      const CameraPosition(target: LatLng(41.096942, 28.779643), zoom: 16);
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
  bool isLoading = false;
  double newMarkersLat;
  double newMarkersLng;

  @override
  void onInit() {
    //2 different marker icons were used according to the fullness.
    customIconCreate();
    super.onInit();
  }

  void customIconCreate() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(128, 128)), 'assets/Green.png')
        .then((d) {
      greenIcon = d;
      //"await" going to crazy sometimes because of harware render.
      // So I used "then" method
      yellowIconCreate();
    });
  }

  void yellowIconCreate() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(128, 128)), 'assets/Yellow.png')
        .then((d) {
      yelloWIcon = d;
      getMarkersFromFireBase();
    });
  }

  getMarkersFromFireBase() async {
    isLoading = true;
    update();
    // Get Markers from Firebase RTDB
    final snapshot = await markersFirebase.once();
    if (snapshot.value == null) {
      // if First open app you can generate points around the main point.
      // This boolean variable manages generate Dialog on HomePageScreen
      isFirstOpen = true;
    } else {
      // Get Markers
      final Iterable results = snapshot.value.values as Iterable;
      //print(snapshot.value);
      for (final dynamic item in results) {
        final double fullness = double.tryParse(item["fullness"].toString());
        if (fullness == null) {
          //Some fullness values coming null because of my create function
          //is not working well. So I accepted them zero.
          customIcon = greenIcon;
        } else if (fullness > 20) {
          customIcon = yelloWIcon;
        } else {
          customIcon = greenIcon;
        }
        //Parsed for using relocation
        final double lat = double.tryParse(item["lat"].toString());
        final double lng = double.tryParse(item["lng"].toString());
        //Add marker
        if (lat != null) {
          markers.add(Marker(
              position: LatLng(lat, lng),
              markerId: MarkerId(item["name"].toString()),
              icon: customIcon,
              onTap: () => showContainerDetail(
                  item["name"].toString(),
                  item["next"].toString(),
                  item["fullness"].toString(),
                  lat,
                  lng)));
        }
      }
    }
    isLoading = false;
    //Update Widgets.
    update();
  }

  void showContainerDetail(
      //This shows information on Dialog when user taps marker
      String name,
      String next,
      String fullness,
      double lat,
      double lng) {
    containerDetailname = name;
    containerDetailnext = next;
    //if fullness null accepted zero.
    fullness == "null"
        ? containerDetailfullness = "0.0"
        : containerDetailfullness = fullness;
    containerDetailLat = lat;
    containerDetailLng = lng;
    //Show Detail Dialog
    isContainerDetailShow = true;
    //Update Widgets.
    update();
  }

  void addNewMarker(LatLng value) {
    if (isRelocationActive) {
      //If tapped relocation button and long pressed by user
      newMarkersLat = value.latitude;
      newMarkersLng = value.longitude;
      //clear other markers
      markers.clear();
      //Add new marker on screen
      markers.add(Marker(
        position: LatLng(value.latitude, value.longitude),
        markerId: const MarkerId("newMarker"),
        icon: greenIcon,
      ));
      //Update Widgets.
      update();
    }
  }

  void relocate() {
    //Activate Relocation Screen
    isRelocationActive = true;
    isContainerDetailShow = false;
    markers.clear();
    update();
  }

  void updateLocation() {
    //Saves to Firebase rtdb and enden relocation screen
    isRelocationActive = false;
    isContainerDetailShow = false;
    markersFirebase.child(containerDetailname).update(
        {'lat': newMarkersLat.toString(), 'lng': newMarkersLng.toString()});
    Get.snackbar("Confirmed", "Your bin has been relocated successfully!");
    //Clear all markers and refetch from db
    markers.clear();
    getMarkersFromFireBase();
    //Update Widgets.
    update();
  }

  void createFireBaseDB() {
    isLoading = true;
    update();
    //This code adds 1000 point around the main point. This code not working very well but doing its job.
    final rnd = Random();
    for (var i = 0; i < 1000; i++) {
      double lt;
      double ln;
      double fullness;
      if (i % 2 == 0) {
        lt = 41.096942 + (rnd.nextDouble() / 100);
        ln = 28.779643 + (rnd.nextDouble() / 100);
        i > 50 ? fullness = i / 50 : fullness = i.toDouble();
      } else {
        lt = 41.096942 - (rnd.nextDouble() / 100);
        ln = 28.779643 - (rnd.nextDouble() / 100);
        i > 50 ? fullness = i / 50 : fullness = i.toDouble();
      }

      //print("$lt,$ln");
      final marker = MarkerModel(
          name: "Container$i",
          next: DateTime.now().add(Duration(days: i)).toString(),
          fullness: fullness.toString(),
          lat: lt.toString(),
          lng: ln.toString());
      markersFirebase.child("Container$i").set(marker.toJson());
      isFirstOpen = false;
      getMarkersFromFireBase();
      isLoading = false;
      update();
    }
  }
}
