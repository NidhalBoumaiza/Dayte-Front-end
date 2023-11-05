import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerEditScreen extends GetxController {
  TextEditingController name = TextEditingController();

  TextEditingController birthday = TextEditingController();

  RxString gender = 'man'.obs;

  void editGender(String genderToChange) {
    if (gender.value == genderToChange) {
      gender.value = '';
    } else {
      gender.value = genderToChange;
    }
  }
}
