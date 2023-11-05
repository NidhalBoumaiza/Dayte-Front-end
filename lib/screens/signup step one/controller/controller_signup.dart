import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constant.dart';

class SignUpController extends GetxController {
  String phone_number = '';
  String country_code = '';
  String password = '';
  String Confpassword = '';
  String first_name = '';
  String last_name = '';
  String verification_code = '';
  String number = '';
  RxBool isLoading = false.obs;
  RxBool pack1 = false.obs;
  RxBool pack2 = false.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxBool LocationLoading = false.obs;

  void changePack(p1, p2) {
    if (p1.value) {
      p1.value = false;
    }
    p2.value = !p2.value;
  }

  Future<http.Response> verifyCode(phoneNumber, countryCode) async {
    var data = {
      "phone_number": phoneNumber,
      "code": countryCode,
    };
    var body = jsonEncode(data);
    final res = await http.post(
      Uri.parse("${dotenv.env['URL']}/auth/phone-number-verification/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    print(res.body);
    return res;
  }

  Future<http.Response> createAccountPhoneNumber(
      phonenbr, password, confpassword) async {
    print(phonenbr);
    var data = {
      "phone_number": phonenbr,
      "password": password,
      "password2": confpassword,
    };
    var body = jsonEncode(data);
    final res = await http.post(
      Uri.parse("${dotenv.env['URL']}/auth/phone-number-register/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return res;
  }

  Future<http.Response> createAccountfullInfo(
      phonenumber, countrycode, passwordd, firstname, lastname) async {
    var data = {
      "phone_number": phonenumber,
      "country_code": countrycode,
      "password": passwordd,
      "first_name": firstname,
      "last_name": lastname
    };
    var body = jsonEncode(data);
    final res = await http.post(
      Uri.parse("$URL/RegisterWithPhoneNum"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return res;
  }

  Future<http.Response> login(
      countrycode, phonenumber, passwordd, firstname, lastname) async {
    var data = {
      "phone_number": phonenumber,
      "country_code": countrycode,
      "password": passwordd,
    };
    var body = jsonEncode(data);
    final res = await http.post(
      Uri.parse("$URL/LoginWithPhoneNum/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return res;
  }
}
