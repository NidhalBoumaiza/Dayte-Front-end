import 'package:dayte/Widget/gender_select.dart';
import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Widget/continueButton.dart';
import '../../../constant.dart';
import '../controller/controller_account_creation.dart';

class FinishingAccountStepTwo extends StatelessWidget {
  const FinishingAccountStepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountCreationController = Get.find<AccountCreationController>();
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 60, 15, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget("What gender best describes you?",
                            AppColor.red, 21.0, FontWeight.w700, 0.0),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                accountCreationController.selectGender("man");
                              },
                              child: Obx(
                                () => GenderSelect(
                                  containerColor:
                                      accountCreationController.gender.value ==
                                              'man'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  horizontalPadding: 20,
                                  function: () {},
                                  borderColor:
                                      accountCreationController.gender.value ==
                                              'man'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  // AppColor.red,
                                  checked: const SizedBox(),
                                  // SvgPicture.string(doubleCheck)
                                  textGender: 'Man',
                                  textColor:
                                      accountCreationController.gender.value ==
                                              'man'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                accountCreationController.selectGender("woman");
                              },
                              child: Obx(
                                () => GenderSelect(
                                  containerColor:
                                      accountCreationController.gender.value ==
                                              'woman'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  horizontalPadding: 20,
                                  function: () {},
                                  borderColor:
                                      accountCreationController.gender.value ==
                                              'woman'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  // AppColor.red,
                                  checked: const SizedBox(),
                                  // SvgPicture.string(doubleCheck)
                                  textGender: 'Woman',
                                  textColor:
                                      accountCreationController.gender.value ==
                                              'woman'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                accountCreationController.selectGender('other');
                              },
                              child: Obx(
                                () => GenderSelect(
                                  horizontalPadding: 20,
                                  function: () {},
                                  containerColor:
                                      accountCreationController.gender.value ==
                                              'other'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  borderColor:
                                      accountCreationController.gender.value ==
                                              'other'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  checked: const SizedBox(),
                                  textGender: 'Non-binary',
                                  textColor:
                                      accountCreationController.gender.value ==
                                              'other'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(
                                  color: Color(0xffADA9A9),
                                  width: 2,
                                ),
                                splashRadius: 0,
                                value: accountCreationController.hidden.value,
                                onChanged: (bool? newValue) {
                                  accountCreationController.hidden.value =
                                      !accountCreationController.hidden.value;
                                },
                                activeColor: const Color(0xffADA9A9),
                                checkColor: AppColor.red,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                accountCreationController.hidden.value =
                                    !accountCreationController.hidden.value;
                              },
                              child: SizedBox(
                                child: TextWidget(
                                    "Hidden",
                                    const Color(0xffADA9A9),
                                    15.0,
                                    FontWeight.w500,
                                    0.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: SizeScreen.height * 0.36),
                    Center(
                      child: ContinueButton(
                        onpress: () {
                          if (accountCreationController.gender.value == "") {
                            snackbar(
                                context,
                                1,
                                "You have to select your gender",
                                Colors.redAccent);
                          } else {
                            Get.toNamed("/accountstepthree");
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
            ),
          )
        ],
      ),
    );
  }
}
