import 'dart:convert';

import 'package:dayte/Widget/button_next.dart';
import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../signup step one/controller/controller_signup.dart';

class SignupStepPassword extends StatelessWidget {
  const SignupStepPassword({Key? key}) : super(key: key);

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
          appBar: AppBar(
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
                      TextWidget("Enter new password", AppColor.grey, 13.0,
                          FontWeight.w600, 0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        function: (ch) {
                          signupcontroller.password = ch;
                        },
                        obsecuretext: true,
                        hint: 'Password',
                        keyboardType: TextInputType.name,
                        inputdecoration: KinputDecoration.copyWith(
                          focusedBorder: InputBorder.none,
                          // Remove the focused border
                          enabledBorder: InputBorder.none,
                          // Remove the non-focused border
                          filled: true,
                          fillColor: const Color(0xffEDECEC),
                          hintStyle: const TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          hintText: "Password",
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextWidget("Confirm new password", AppColor.grey, 13.0,
                          FontWeight.w600, 0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        obsecuretext: true,
                        function: (ch) {
                          signupcontroller.Confpassword = ch;
                        },
                        hint: 'Confirm new password',
                        keyboardType: TextInputType.name,
                        inputdecoration: KinputDecoration.copyWith(
                          focusedBorder: InputBorder.none,
                          // Remove the focused border
                          enabledBorder: InputBorder.none,
                          // Remove the non-focused border
                          filled: true,
                          fillColor: const Color(0xffEDECEC),
                          hintStyle: const TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          hintText: "Confirm new password",
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Obx(
                    () => ButtonNext(
                      SizeScreen.width * 0.8,
                      SizeScreen.height * 0.07,
                      signupcontroller.isLoading.value == false
                          ? () async {
                              if (signupcontroller.password == "" ||
                                  signupcontroller.Confpassword !=
                                      signupcontroller.password) {
                                snackbar(
                                  context,
                                  1,
                                  "Please enter and verify your password",
                                  Colors.redAccent,
                                );
                                return;
                              } else {
                                signupcontroller.isLoading.value = true;
                                var res = await signupcontroller
                                    .createAccountPhoneNumber(
                                  "${signupcontroller.country_code}${signupcontroller.phone_number}",
                                  signupcontroller.password,
                                  signupcontroller.Confpassword,
                                );
                                var response = jsonDecode(res.body);
                                if (res.statusCode == 200) {
                                  signupcontroller.isLoading.value = false;
                                  Get.offAllNamed('/signinsteptwo');
                                  snackbar(context, 4, response["message"],
                                      Colors.green);
                                } else {
                                  signupcontroller.isLoading.value = false;
                                  snackbar(context, 1, response["message"],
                                      Colors.redAccent);
                                }
                              }
                            }
                          : null,
                      AppColor.red,
                      signupcontroller.isLoading.value == false
                          ? "Next"
                          : "Wait...",
                    ),
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
