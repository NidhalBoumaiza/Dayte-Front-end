import 'dart:convert';
import 'dart:io';

import 'package:dayte/Widget/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountCreationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  Rx<TextEditingController> birthdayController = TextEditingController().obs;
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  RxBool hidden = false.obs;
  RxList<File?> imagesList = <File?>[].obs;
  RxList<String> images = <String>[].obs;
  RxList<String> interests = <String>[].obs;
  RxString gender = 'man'.obs;
  RxBool isLoading = false.obs;
  List prompts = [];
  List description = [];

  void selectGender(String genderToChange) {
    if (gender.value == genderToChange) {
      gender.value = '';
    } else {
      gender.value = genderToChange;
    }
  }

  addInterest(String inter) {
    if (interests.contains(inter)) {
      interests.remove(inter);
    } else {
      interests.add(inter);
    }
  }

  void finishAccount(context) async {
    isLoading.value = true;
    //createAndWriteFile(interests[0]);
    print(images.length);
    var data = {
      "name": nameController.text,
      "birth_date": birthdayController.value.text,
      "gender": gender.value,
      "interests": interests,
      "photos": images,
      "prompts": ["sltjgbsth", "qlsfhsbdfgbsdfg"],
      "answers": ["sltjgbsth", "qlsfhsbdfgbsdfg"],
    };
    var body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    print(token);
    var res = await http.post(
      Uri.parse("${dotenv.env['URL']}/auth/finish-profile/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    var resBody = json.decode(res.body);
    if (res.statusCode == 200) {
      isLoading.value = false;
      snackbar(context, 1, resBody["message"], Colors.green);
      Get.offAllNamed('/location', arguments: {"api": true});
    } else {
      isLoading.value = false;
      snackbar(context, 1, 'Something went very wrong', Colors.redAccent);
    }
  }
}

// void createAndWriteFile(content) async {
//
//   // Define the file path where you want to create the file.
//   String filePath = '/path/to/your/file.txt'; // Replace with the desired file path.
//
//   try {
//     final File file = File(filePath);
//
//     // Write the content to the file.
//     await file.writeAsString(content);
//
//     print('File created and content written successfully to: $filePath');
//   } catch (e) {
//     print('Error: $e');
//   }
