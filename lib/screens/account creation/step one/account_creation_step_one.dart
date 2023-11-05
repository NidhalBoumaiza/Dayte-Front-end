import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Widget/button_next.dart';
import '../../../Widget/continueButton.dart';
import '../../../Widget/text_field.dart';
import '../../../constant.dart';
import '../controller/controller_account_creation.dart';

class FinishingAccountStepOne extends StatelessWidget {
  FinishingAccountStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountCreationController = Get.put(AccountCreationController());
    void _showDatePicker(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          height: SizeScreen.height * 0.43,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  height: SizeScreen.height * 0.3,
                  child: child,
                ),
                const SizedBox(height: 20),
                ButtonNext(
                  SizeScreen.width * 0.45,
                  SizeScreen.height * 0.055,
                  () {
                    accountCreationController.birthdayController.value.text =
                        DateFormat('yyyy-MM-dd')
                            .format(accountCreationController.date);
                    Get.back();
                  },
                  AppColor.red,
                  "Finish",
                ),
              ],
            ),
          ),
        ),
      );
    }

    print(accountCreationController.birthdayController.value.text);
    return SafeArea(
        child: Stack(
      children: [
        SvgPicture.string(
          backgroundEmpty,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 90, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("Let's start Dayting", AppColor.red, 21.0,
                          FontWeight.w700, 0.0),
                      const SizedBox(height: 70),
                      TextWidget(
                          "Name", AppColor.grey, 13.0, FontWeight.w700, 0.0),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        controller: accountCreationController.nameController,
                        function: (String) {},
                        hint: 'Enter your name...',
                        keyboardType: TextInputType.name,
                        inputdecoration: KinputDecoration.copyWith(
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            hintText: "Enter your name...",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 17,
                                color: AppColor.greyTextField,
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
                      TextWidget("Birthday", AppColor.grey, 13.0,
                          FontWeight.w700, 0.0),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          /// TODO
                          _showDatePicker(
                            CupertinoDatePicker(
                              initialDateTime: accountCreationController.date,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This shows day of week alongside day of month
                              showDayOfWeek: true,
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                accountCreationController.date = newDate;
                                //setState(() => date = newDate);
                              },
                            ),
                          );
                        },
                        child: TextFieldWidget(
                          controller: accountCreationController
                              .birthdayController.value,
                          enabled: false,
                          function: (String) {},
                          hint: 'Select your birthday...',
                          keyboardType: TextInputType.name,
                          inputdecoration: KinputDecoration.copyWith(
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              hintText: "Select your birthday...",
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 17,
                                  color: AppColor.greyTextField,
                                ),
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.cakeCandles,
                                  size: 17,
                                  color: AppColor.greyTextField,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ContinueButton(
                    onpress: () {
                      if (accountCreationController.nameController.text == "" ||
                          accountCreationController
                                  .birthdayController.value.text ==
                              "") {
                        snackbar(context, 1, "You have to fill all the fields",
                            Colors.redAccent);
                      } else {
                        Get.toNamed("accountsteptwo");
                      }
                    },
                    width: SizeScreen.width * 0.63,
                    height: SizeScreen.height * 0.062,
                    borderColor: AppColor.red,
                    textColor: AppColor.red,
                    textButton: 'Continue',
                    widget: SvgPicture.string(continueArrow),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
