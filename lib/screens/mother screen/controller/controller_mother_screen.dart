import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widget/snackBar.dart';
import '../../../models/matches.dart';
import '../../../models/myProfile_model.dart';
import '../../../models/profiles_model.dart';

class MotherScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Suggestions> listSuggestions = <Suggestions>[].obs;
  late User myProfile;
  RxList<Matches> listMatches = <Matches>[].obs;

  Future getHomeSuggestions() async {
    isLoading.value = true;
    print(isLoading.value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    var res = await http.get(
      Uri.parse("${dotenv.env['URL']}/base/home/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      isLoading.value = false;
      // Simulate fetching data from the API
      Map<String, dynamic> jsonData = json.decode(res.body);
      print(jsonData["user"]);
      // Parse the JSON data and populate the events list
      if (jsonData['suggestions'] != null) {
        print(jsonData['suggestions']);
        listSuggestions.value = List<Suggestions>.from(
          jsonData['suggestions'].map((x) => Suggestions.fromJson(x)),
        );
        if (jsonData["user"] != null) {
          this.myProfile = User.fromJson(jsonData["user"]);
        }
        if (jsonData["matches"] != null) {
          listMatches.value = List<Matches>.from(
            jsonData['matches'].map((x) => Matches.fromJson(x)),
          );
        }

        if (listMatches.isNotEmpty) {
          Get.toNamed("/itsadate", arguments: {
            "picture": listMatches[0].profilePicture,
            "myPicture": myProfile.pictures?[0],
          });
        }

        print("èèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèèè");
        print(listMatches.length);
        return 0;
      }
    } else {
      isLoading.value = false;
      return 0;
    }
  }

  void editGender(String genderToChange) {
    if (myProfile.gender?.value == genderToChange) {
      myProfile.gender?.value = '';
    } else {
      myProfile.gender?.value = genderToChange;
    }
  }

  void likeProfile(int index, context) async {
    print(index);

    print(listSuggestions.length);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');

    var data = {
      "id": listSuggestions[index].id,
    };
    var body = jsonEncode(data);
    var res = await http.post(
      Uri.parse("${dotenv.env['URL']}/base/like/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
    final resBody = json.decode(res.body);
    print(resBody);
    if (res.statusCode == 200 && resBody["message"] != "match") {
      listSuggestions[index].liked?.value = true;

      print("7chinah");
      snackbar(context, 3, "7chinah", Colors.green);
    } else if (res.statusCode == 200 && resBody["message"] == "match") {
      listSuggestions[index].liked?.value = true;
      Get.toNamed("/itsadate", arguments: {
        "picture": resBody["pictures"],
        "myPicture": myProfile.pictures?[0],
      });
    } else {}
  }

// void editProfile() {
//
//   var data = {
//
//   }
//   var res = http.patch(
//     Uri.parse("${dotenv.env['URL']}/base/edit/"),
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer $token',
//     },
//     body: bpdy
//   );
// }


}
