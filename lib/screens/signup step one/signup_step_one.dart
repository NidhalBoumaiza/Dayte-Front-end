import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../Widget/button_next.dart';
import '../../Widget/snackBar.dart';
import '../../Widget/text_widget.dart';
import 'controller/controller_signup.dart';

class SignupStepOne extends StatelessWidget {
  const SignupStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupcontroller = Get.find<SignUpController>();
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
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          "Enter your mobile number",
                          style: GoogleFonts.openSans(
                            color: AppColor.black,
                            fontSize: 19,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: height * 0.0635,
                          width: width * 0.7,
                          child: InternationalPhoneNumberInput(
                            initialValue: PhoneNumber(
                              phoneNumber: '',
                              dialCode: "+216",
                              isoCode: "TN",
                            ),
                            inputDecoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xff979797)), // Change the border color here
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xff979797)), // Change the focused border color here
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xff979797)), // Change the enabled border color here
                              ),
                              hintText: 'Phone number',
                              hintStyle: GoogleFonts.roboto(
                                color: const Color(0xff979797),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            textStyle: const TextStyle(
                              color: Color(0xff979797),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            isEnabled: true,
                            onInputChanged: (PhoneNumber number) {
                              signupcontroller.country_code = number.dialCode!;
                              signupcontroller.number = number.phoneNumber!;
                              signupcontroller.phone_number =
                                  number.phoneNumber!;
                              signupcontroller.phone_number =
                                  signupcontroller.phone_number.replaceAll(
                                      signupcontroller.country_code, "");
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            spaceBetweenSelectorAndTextField: 0,
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: const TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                            ),
                            formatInput: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: TextWidget("Or connect with social",
                              AppColor.red, 17.0, FontWeight.w500, 0.0),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "By continuing you may receive an SMS for verification. Message and data rates may apply.",
                        style: GoogleFonts.roboto(
                          color: const Color(0xff979797),
                          fontSize: 12,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      ButtonNext(
                        width * 0.8,
                        height * 0.07,
                        () async {
                          print(
                              "${signupcontroller.country_code}${signupcontroller.phone_number}");
                          if (signupcontroller.phone_number.isEmpty) {
                            snackbar(
                                context,
                                1,
                                "You have to enter a valid phone number",
                                Colors.redAccent);
                          } else {
                            Get.toNamed('/createpassword');
                          }
                        },
                        AppColor.red,
                        "Next",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
