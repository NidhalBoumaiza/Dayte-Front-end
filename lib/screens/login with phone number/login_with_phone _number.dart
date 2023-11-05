import 'dart:convert';

import 'package:dayte/Widget/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widget/button_next.dart';
import '../../constant.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  String country_code = '';
  String phone_number = '';
  String password = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 30),
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
                              country_code = number.dialCode!;
                              phone_number = number.phoneNumber!;
                              phone_number =
                                  phone_number.replaceAll(country_code, "");
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
                        SizedBox(height: 25),
                        Text(
                          "Enter your password",
                          style: GoogleFonts.openSans(
                            color: AppColor.black,
                            fontSize: 19,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextField(
                          onChanged: (ch) {
                            password = ch;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
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
                            hintText: 'Password',
                            hintStyle: GoogleFonts.roboto(
                              color: const Color(0xff979797),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xff979797),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: ButtonNext(
                            width * 0.45,
                            height * 0.06,
                            () async {
                              if (country_code == "" ||
                                  phone_number == "" ||
                                  password == "") {
                                snackbar(
                                    context,
                                    1,
                                    "Fill your phoneNumber and password",
                                    Colors.redAccent);
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                var data = {
                                  "grant_type": "password",
                                  "username": "$country_code$phone_number",
                                  "password": password,
                                  "client_id": dotenv.env['CLIENTID'],
                                };
                                var body = jsonEncode(data);
                                final res = await http.post(
                                  Uri.parse("${dotenv.env['URL']}/auth/token/"),
                                  headers: {
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                  },
                                  body: body,
                                );
                                var response = jsonDecode(res.body);
                                if (res.statusCode == 200) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setString(
                                      'access_token', response["access_token"]);
                                  await prefs.setString('refresh_token',
                                      response['refresh_token']);
                                  var res2 = await http.get(
                                    Uri.parse(
                                        "${dotenv.env['URL']}/base/home/"),
                                    headers: {
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                      'Authorization':
                                          'Bearer ${response["access_token"]}'
                                    },
                                  );
                                  var response2 = jsonDecode(res2.body);

                                  if (res2.statusCode == 200) {
                                    snackbar(context, 2, "Welcome to Dayte",
                                        Colors.green);

                                    Get.toNamed(
                                      '/location',
                                      arguments: {"api": false},
                                    );
                                  } else if (res2.statusCode == 400) {
                                    snackbar(context, 2, response2["message"],
                                        Colors.green);
                                    Get.offAllNamed('accountstepone');
                                  }
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  snackbar(
                                      context,
                                      1,
                                      "Check your phoneNumber and password",
                                      Colors.redAccent);
                                }
                                print(response);
                              }
                            },
                            AppColor.red,
                            isLoading == false ? "Connect" : "Loading...",
                          ),
                        ),
                      ],
                    ),
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
