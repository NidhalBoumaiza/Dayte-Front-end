import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Widget/animation.dart';
import '../../Widget/button_next.dart';
import '../../function_get_location.dart';
import '../signup step one/controller/controller_signup.dart';

class SignupStepThree extends StatelessWidget {
  const SignupStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupcontroller = Get.find<SignUpController>();
    return SafeArea(
        child: Stack(
          children: [
            SvgPicture.string(
              backgroundEmpty,
              fit: BoxFit.cover,
            ),
            Scaffold(
              // appBar: appBar,
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: AnimationTop(
                                  child: SvgPicture.string(positionImage))),
                          SizedBox(height: 25),
                          TextWidget("Enable Location", Color(0xff2B2627), 18.0,
                              FontWeight.w500, 0.0),
                          SizedBox(height: 15),
                          TextWidget(
                            "Allow Dayte to access your location? You must allow access for Dayte to work. We will only track your location while on duty.",
                            Color(0xff2B2627),
                            12.0,
                            FontWeight.w500,
                            0.0,
                            textalign: TextAlign.center,
                          ),
                          SizedBox(height: 100)
                        ],
                      ),
                    ),
                    Obx(
                          () =>
                          ButtonNext(
                            SizeScreen.width * 0.8,
                            SizeScreen.height * 0.07,
                            signupcontroller.LocationLoading.value == false
                                ? () async {
                              getCurrentLocation(context);

                              //Get.offAllNamed('/signinstepfour');
                            }
                                : null,
                            AppColor.red,
                            signupcontroller.LocationLoading.value == false
                                ? "Next"
                                : "Wait...",
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
