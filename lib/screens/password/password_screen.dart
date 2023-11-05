import 'package:dayte/Widget/button_next.dart';
import 'package:dayte/Widget/continueButton.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:dayte/screens/availability%20screen/availability_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SvgPicture.string(
          backgroundEmpty,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Transform(
              transform: Matrix4.translationValues(-0.0, 0.0, 0.0),
              child: TextWidget(
                  "Password", AppColor.red, 21.0, FontWeight.w700, 0.0),
            ),
            leading: GestureDetector(
              onTap: () {
                ///TODO LATER
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: SizedBox(child: SvgPicture.string(arrowBack)),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 40, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/changepassword");
                        },
                        child: TextFieldWidget(
                          function: (String) {},
                          hint: 'Enter your name...',
                          keyboardType: TextInputType.name,
                          enabled: false,
                          inputdecoration: KinputDecoration.copyWith(
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.red,
                                  width: 2.4,
                                ), // Change the enabled border color here
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              hintText: "Change password",
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 0.0),
                                child: Icon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 17,
                                  color: AppColor.red,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/forgetpasswordstepone");
                        },
                        child: TextFieldWidget(
                          function: (String) {},
                          hint: 'Enter your name...',
                          keyboardType: TextInputType.phone,
                          enabled: false,
                          inputdecoration: KinputDecoration.copyWith(
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.red,
                                  width: 2.4,
                                ), // Change the enabled border color here
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              hintText: "Forgot password",
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 0.0),
                                child: Icon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 17,
                                  color: AppColor.red,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
    ;
  }
}
