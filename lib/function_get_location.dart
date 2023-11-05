import 'dart:convert';

import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/screens/signup%20step%20one/controller/controller_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void getCurrentLocation(context) async {
  var signupcontroller = Get.find<SignUpController>();

  bool serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (serviceEnable) {
    LocationPermission checkpermission = await Geolocator.checkPermission();

    if (checkpermission == LocationPermission.denied) {
      LocationPermission requestpermission =
          await Geolocator.requestPermission();
      //------------------------------
      if (requestpermission == LocationPermission.whileInUse) {
        Get.toNamed('/motherscreen');
      }
      //------------------------------
    } else {
      var cordonne = await Geolocator.getCurrentPosition();
      signupcontroller.latitude = cordonne.latitude;
      signupcontroller.longitude = cordonne.longitude;

      var data = {
        "lat": signupcontroller.latitude,
        "lng": signupcontroller.longitude
      };
      var body = jsonEncode(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('access_token');
      var res = await http.patch(
        Uri.parse("${dotenv.env["URL"]}/base/update-location/"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      if (res.statusCode == 200) {
        Get.toNamed('/motherscreen');
      } else {
        snackbar(context, 2, "Something went very wrong", Colors.redAccent);
      }
    }
    signupcontroller.LocationLoading.value = false;
  } else {
    bool locationOpened = await Geolocator.openLocationSettings();
    signupcontroller.LocationLoading.value = false;
    print("no");
  }
}

// void liveLocation() {
//   LocationSettings locationSettings = const LocationSettings(
//     accuracy: LocationAccuracy.bestForNavigation,
//     distanceFilter: 100,
//   );
//
//   Geolocator.getPositionStream(locationSettings: locationSettings)
//       .listen((Position position) {
//     controllerSignUpSteps.latitude = position.latitude;
//     controllerSignUpSteps.longitude = position.longitude;
//   });
// }

Future<String?> GetAddressFromLatLong(lat, long) async {
  List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
  return placemark[0].street;
}

Future<void> _getCityName(double latitude, double longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);

  if (placemarks.isNotEmpty) {
    Placemark placemark = placemarks.first;
    String? cityName = placemark.locality; // Get the city name
    print("City Name: $cityName");
  }
}
