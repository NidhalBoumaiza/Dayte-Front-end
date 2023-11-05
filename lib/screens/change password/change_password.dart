import 'dart:convert';

import 'package:dayte/Widget/button_next.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Widget/snackBar.dart';
import '../../main.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassController = TextEditingController();
    TextEditingController newPassController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
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
                  "Change password", AppColor.red, 21.0, FontWeight.w700, 0.0),
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
                      TextWidget("Enter old password", AppColor.grey, 13.0,
                          FontWeight.w600, 0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        controller: oldPassController,
                        obsecuretext: true,
                        function: (String) {},
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
                      TextWidget("Enter new password", AppColor.grey, 13.0,
                          FontWeight.w600, 0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        controller: newPassController,
                        obsecuretext: true,
                        function: (String) {},
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
                        controller: confirmPassController,
                        obsecuretext: true,
                        function: (String) {},
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
                    ],
                  ),
                ),
                Center(
                  child: ButtonNext(
                    SizeScreen.width * 0.8,
                    SizeScreen.height * 0.07,
                    isLoading == false
                        ? () async {
                            if (oldPassController.text.isEmpty ||
                                newPassController.text.isEmpty ||
                                confirmPassController.text.isEmpty) {
                              snackbar(
                                  context,
                                  2,
                                  "You have to fill all the fields",
                                  Colors.redAccent);
                              return;
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              var data = {
                                "old_password": oldPassController.text,
                                "new_password": newPassController.text,
                                "new_password2": confirmPassController.text,
                              };
                              var body = json.encode(data);
                              var res = await http.post(
                                Uri.parse(
                                    "${dotenv.env['URL']}/auth/update-password/"),
                                headers: {
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                  'Authorization': 'Bearer $token',
                                },
                                body: body,
                              );
                              var response = json.decode(res.body);
                              if (res.statusCode == 200 ||
                                  res.statusCode == 201) {
                                setState(() {
                                  isLoading = false;
                                });
                                snackbar(context, 2, response['message'],
                                    Colors.green);
                                Get.back();
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                snackbar(context, 2, response['message'],
                                    Colors.redAccent);
                              }
                            }
                          }
                        : null,
                    AppColor.red,
                    isLoading == false ? "Submit" : "Wait...",
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
