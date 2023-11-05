import 'package:dayte/Widget/button_next.dart';
import 'package:flutter/material.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgetPasswordStepOne extends StatelessWidget {
  const ForgetPasswordStepOne({Key? key}) : super(key: key);

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
                  "Forgot password", AppColor.red, 21.0, FontWeight.w700, 0.0),
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
                      TextWidget(
                          "Enter the phone number attached to your account",
                          AppColor.grey,
                          13.0,
                          FontWeight.w600,
                          0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        function: (String) {},
                        hint: 'Password',
                        keyboardType: TextInputType.phone,
                        inputdecoration: KinputDecoration.copyWith(
                          focusedBorder:
                              InputBorder.none, // Remove the focused border
                          enabledBorder:
                              InputBorder.none, // Remove the non-focused border
                          filled: true,
                          fillColor: const Color(0xffEDECEC),
                          hintStyle: const TextStyle(
                              color: AppColor.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          hintText: "Phone number",
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ButtonNext(
                    SizeScreen.width * 0.8,
                    SizeScreen.height * 0.07,
                    () async {
                      Get.toNamed("/forgetpasswordsteptwo");
                    },
                    AppColor.red,
                    "Next",
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
