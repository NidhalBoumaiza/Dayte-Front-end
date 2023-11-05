import 'package:dayte/Widget/gender_select.dart';
import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Widget/continueButton.dart';
import '../../../constant.dart';
import '../../../svgImages.dart';
import '../controller/controller_account_creation.dart';

class FinishingAccountStepFour extends StatelessWidget {
  const FinishingAccountStepFour({Key? key}) : super(key: key);

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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 60, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("Select your interests", AppColor.red, 21.0,
                          FontWeight.w700, 0.0),
                      const SizedBox(height: 5),
                      TextWidget(
                          "Select a few of your interests and let everyone know what you’re passionate about.",
                          AppColor.grey,
                          12.0,
                          FontWeight.w400,
                          0.0,
                          height: 1.6),
                      const SizedBox(height: 50),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("travelling");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("travelling")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("travelling")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("travelling")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: SizedBox(
                                                height: 18,
                                                width: 18,
                                                child: SvgPicture.string(
                                                    doubleCheck)))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Travelling',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("music");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("music")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("music")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("music")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Music',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("photography");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("photography")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("photography")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("photography")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Photography',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("dancing");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("dancing")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("dancing")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("dancing")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Dancing',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest('books');
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("books")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("books")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("books")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Books',
                                  ),
                                ),
                              ),
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      accountCreationController
                                          .addInterest('reading');
                                    },
                                    child: GenderSelect(
                                      containerWidth: accountCreationController
                                              .interests
                                              .contains("reading")
                                          ? 105
                                          : 90,
                                      containerColor: AppColor.white,
                                      radious: 5,
                                      function: () {},
                                      borderColor: accountCreationController
                                              .interests
                                              .contains("reading")
                                          ? AppColor.red
                                          : const Color(0xffE8E6EA),
                                      // AppColor.red,
                                      checked: accountCreationController
                                              .interests
                                              .contains("reading")
                                          ? SizedBox(
                                              height: 18,
                                              width: 18,
                                              child: SvgPicture.string(
                                                  doubleCheck))
                                          : const SizedBox(),
                                      // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                      textGender: 'Reading',
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      accountCreationController
                                          .addInterest("sport");
                                    },
                                    child: GenderSelect(
                                      containerWidth: accountCreationController
                                              .interests
                                              .contains("sport")
                                          ? 105
                                          : 90,
                                      containerColor: AppColor.white,
                                      radious: 5,
                                      function: () {},
                                      borderColor: accountCreationController
                                              .interests
                                              .contains("sport")
                                          ? AppColor.red
                                          : const Color(0xffE8E6EA),
                                      // AppColor.red,
                                      checked: accountCreationController
                                              .interests
                                              .contains("sport")
                                          ? SizedBox(
                                              height: 18,
                                              width: 18,
                                              child: SvgPicture.string(
                                                  doubleCheck))
                                          : const SizedBox(),
                                      // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                      textGender: 'Sport',
                                    ),
                                  )),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("modeling");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("modeling")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("modeling")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("modeling")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Modeling',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("painting");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("painting")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("painting")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("painting")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Painting',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("shopping");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("shopping")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("shopping")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("shopping")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Shopping',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("animals");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("animals")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("animals")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("animals")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Animals',
                                  ),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    accountCreationController
                                        .addInterest("drawing");
                                  },
                                  child: GenderSelect(
                                    containerWidth: accountCreationController
                                            .interests
                                            .contains("drawing")
                                        ? 105
                                        : 90,
                                    containerColor: AppColor.white,
                                    radious: 5,
                                    function: () {},
                                    borderColor: accountCreationController
                                            .interests
                                            .contains("drawing")
                                        ? AppColor.red
                                        : const Color(0xffE8E6EA),
                                    // AppColor.red,
                                    checked: accountCreationController.interests
                                            .contains("drawing")
                                        ? SizedBox(
                                            height: 18,
                                            width: 18,
                                            child:
                                                SvgPicture.string(doubleCheck))
                                        : const SizedBox(),
                                    // SizedBox(height : 18 , width : 18 , child: SvgPicture.string(doubleCheck))
                                    textGender: 'Drawing',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            /// TODO LATER
                          },
                          child: SvgPicture.string(more)),
                    ],
                  ),
                ),
                Center(
                  child: ContinueButton(
                    onpress: () {
                      if (accountCreationController.interests.isEmpty) {
                        snackbar(
                            context,
                            1,
                            "You have to select at least one interest",
                            Colors.redAccent);
                      } else {
                        Get.toNamed("/accountstepfive");
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
