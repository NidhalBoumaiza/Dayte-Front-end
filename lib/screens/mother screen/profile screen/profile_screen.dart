import 'package:dayte/Widget/profile_picture_widget.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widget/button_next.dart';
import '../../../svgImages.dart';
import '../controller/controller_mother_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllerHome = Get.find<MotherScreenController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextWidget("Profile", AppColor.red, 35.0, FontWeight.w800, 0.5),
            const SizedBox(height: 20),
            Center(
              child: profilePictureWidget(
                heightProfilePic: 150,
                widthProfilePic: 150,
                img: controllerHome.myProfile.pictures![0],
              ),
            ),
            const SizedBox(height: 15),
            TextWidget("${controllerHome.myProfile.name}", AppColor.black, 25.0,
                FontWeight.w700, 0.2),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/editprofile");
                    },
                    child: TextFieldWidget(
                      enabled: false,
                      function: (String) {},
                      hint: 'Enter your name...',
                      keyboardType: TextInputType.name,
                      inputdecoration: KinputDecoration.copyWith(
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.red,
                            width: 2.4,
                          ), // Change the enabled border color here
                        ),
                        hintStyle: const TextStyle(
                            color: AppColor.black, fontSize: 15),
                        hintText: "Edit profile",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.userLarge,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/password");
                    },
                    child: TextFieldWidget(
                      enabled: false,
                      function: (String) {},
                      hint: 'Password',
                      keyboardType: TextInputType.name,
                      inputdecoration: KinputDecoration.copyWith(
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.red,
                            width: 2.4,
                          ), // Change the enabled border color here
                        ),
                        hintStyle: const TextStyle(
                            color: AppColor.black, fontSize: 15),
                        hintText: "Password",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.lock,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFieldWidget(
                    enabled: false,
                    function: (String) {},
                    hint: 'Billing',
                    keyboardType: TextInputType.name,
                    inputdecoration: KinputDecoration.copyWith(
                      disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.red,
                          width: 2.4,
                        ), // Change the enabled border color here
                      ),
                      hintStyle:
                          const TextStyle(color: AppColor.black, fontSize: 15),
                      hintText: "Billing",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          FontAwesomeIcons.dollarSign,
                          size: 25,
                          color: AppColor.red,
                        ),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          size: 17,
                          color: AppColor.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Logout(context);
                    },
                    child: TextFieldWidget(
                      enabled: false,
                      function: (String) {},
                      hint: 'Logout',
                      keyboardType: TextInputType.name,
                      inputdecoration: KinputDecoration.copyWith(
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.red,
                            width: 2.4,
                          ), // Change the enabled border color here
                        ),
                        hintStyle: const TextStyle(
                            color: AppColor.black, fontSize: 15),
                        hintText: "Logout",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 17,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void Logout(context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      // Drawer from the bottom
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: SizeScreen.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.string(logout)),
              const SizedBox(height: 15),
              TextWidget("Are you sure you want to logout ?", AppColor.grey,
                  15.0, FontWeight.w400, 0.0),
              const SizedBox(height: 30),
              Center(
                child: ButtonNext(
                  SizeScreen.width * 0.8,
                  SizeScreen.height * 0.07,
                  () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('access_token', "");
                    prefs.setString('refresh_token', "");
                    Get.offAllNamed('/signinsignup');
                  },
                  AppColor.red,
                  "Logout",
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
