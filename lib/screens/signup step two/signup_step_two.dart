import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widget/button_next.dart';
import '../../Widget/snackBar.dart';
import '../../constant.dart';
import '../signup step one/controller/controller_signup.dart';

class SignupStepTwo extends StatelessWidget {
  const SignupStepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupcontroller = Get.find<SignUpController>();
    List<FocusNode> focusNodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      // Add more focus nodes for additional text fields
    ];
    void _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          SvgPicture.string(
            backgroundEmpty,
            fit: BoxFit.cover,
          ),
          Scaffold(
            appBar: appBar,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 30),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        SizedBox(
                          width: width * 0.8,
                          child: Text(
                            "Enter the 4-digit code sent to you at",
                            style: GoogleFonts.openSans(
                              color: const Color(0xff595959),
                              fontSize: 19,
                              letterSpacing: 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Text(
                          '${signupcontroller.number}',
                          style: GoogleFonts.openSans(
                              color: const Color(0xff595959),
                              fontSize: 13,
                              letterSpacing: 0.02,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              height: height * 0.08,
                              width: width * 0.1,
                              child: TextField(
                                focusNode: focusNodes[0],
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onChanged: (String ch) {
                                  signupcontroller.verification_code =
                                      signupcontroller.verification_code + ch;
                                  _fieldFocusChange(
                                      context, focusNodes[0], focusNodes[1]);
                                },
                                style: const TextStyle(
                                  color: Color(0xff595959),
                                  fontSize: 20,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                textAlign: TextAlign.center,
                                decoration: KinputDecoration,
                              ),
                            ),
                            const SizedBox(width: 35),
                            SizedBox(
                              height: height * 0.08,
                              width: width * 0.1,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: focusNodes[1],
                                onChanged: (String ch) {
                                  signupcontroller.verification_code =
                                      signupcontroller.verification_code + ch;
                                  _fieldFocusChange(
                                      context, focusNodes[1], focusNodes[2]);
                                },
                                style: const TextStyle(
                                  color: Color(0xff595959),
                                  fontSize: 20,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                textAlign: TextAlign.center,
                                decoration: KinputDecoration,
                              ),
                            ),
                            const SizedBox(width: 35),
                            SizedBox(
                              height: height * 0.08,
                              width: width * 0.1,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: focusNodes[2],
                                onChanged: (String ch) {
                                  signupcontroller.verification_code =
                                      signupcontroller.verification_code + ch;
                                  _fieldFocusChange(
                                      context, focusNodes[2], focusNodes[3]);
                                },
                                style: const TextStyle(
                                  color: Color(0xff595959),
                                  fontSize: 20,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                textAlign: TextAlign.center,
                                decoration: KinputDecoration,
                              ),
                            ),
                            const SizedBox(width: 35),
                            SizedBox(
                              height: height * 0.08,
                              width: width * 0.1,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                focusNode: focusNodes[3],
                                onChanged: (String ch) {
                                  signupcontroller.verification_code =
                                      signupcontroller.verification_code + ch;
                                },
                                style: const TextStyle(
                                  color: Color(0xff595959),
                                  fontSize: 20,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                textAlign: TextAlign.center,
                                decoration: KinputDecoration,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Resent the code",
                            style: GoogleFonts.openSans(
                              color: AppColor.red,
                              fontSize: 13,
                              letterSpacing: 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => ButtonNext(
                          width * 0.8,
                          height * 0.07,
                          () async {
                            if (signupcontroller.verification_code.length !=
                                4) {
                              snackbar(
                                  context,
                                  1,
                                  "You have to enter the verification code",
                                  Colors.redAccent);
                            } else {
                              signupcontroller.isLoading.value = true;
                              var res = await signupcontroller.verifyCode(
                                "${signupcontroller.country_code}${signupcontroller.phone_number}",
                                signupcontroller.verification_code,
                              );
                              var response = jsonDecode(res.body);
                              if (res.statusCode == 200) {
                                signupcontroller.isLoading.value = false;
                                Get.offAllNamed('/signinsignup');
                                snackbar(context, 2, response["message"],
                                    Colors.green);
                              } else {
                                signupcontroller.isLoading.value = false;
                                snackbar(context, 2, response["message"],
                                    Colors.redAccent);
                              }

                              ///TODO LATER
                              // Get.toNamed('/signinstepthree');
                              // var res = await signupcontroller.verifyCode(
                              //     signupcontroller.verification_code,
                              //     signupcontroller.phone_number,
                              //     signupcontroller.country_code);
                              // if (res.statusCode == 200) {
                              //   Get.toNamed('/signinstepthree');
                              // } else {
                              //   var response = jsonDecode(res.body);
                              //   snackbar(context, 1, response["message"],
                              //       Colors.redAccent);
                              // }
                            }
                          },
                          AppColor.red,
                          signupcontroller.isLoading.value == false
                              ? "Next"
                              : "Wait...",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
