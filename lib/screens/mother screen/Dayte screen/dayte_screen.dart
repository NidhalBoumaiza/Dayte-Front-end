import 'dart:ui';

import 'package:dayte/Widget/gender_select.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Widget/dayte_card.dart';
import '../controller/controller_mother_screen.dart';

class DayteScreen extends StatefulWidget {
  const DayteScreen({Key? key}) : super(key: key);

  @override
  State<DayteScreen> createState() => _DayteScreenState();
}

class _DayteScreenState extends State<DayteScreen> {
  var controllerHome = Get.put(MotherScreenController());
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = controllerHome.getDaytes();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 10, 4, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
                child: TextWidget(
                    "Daytes", AppColor.red, 35.0, FontWeight.w800, 0.5)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child:  FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: ShimmerLoadingDaytes());
                  } else {
                    return Obx(
                          () =>
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controllerHome.listDaytes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/itsadate');
                                  },
                                  child: DayteCard(
                                    image: '${dotenv.env['URL']}${controllerHome.listDaytes[index].profilePicture}',
                                    onPress: () {
                                      cancelDayte(context);
                                    }, date: controllerHome.listDaytes[index].date!, time: controllerHome.listDaytes[index].time!,
                                  ),
                                )
                              : ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    tileMode: TileMode.decal,
                                    sigmaX: 3.5,
                                    sigmaY: 3.5,
                                  ),
                                  child: DayteCard(
                                    image: 'images/${index + 1}.png',
                                    onPress: () {}, date: '', time: '',
                                  ),
                                );
                        },
                      ),
                    );
                  }
                },
              ),

              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: 3,
              //   itemBuilder: (BuildContext context, int index) {
              //     return index == 0
              //         ? GestureDetector(
              //             onTap: () {
              //               Get.toNamed('/itsadate');
              //             },
              //             child: DayteCard(
              //               image: 'images/1.png',
              //               onPress: () {
              //                 cancelDayte(context);
              //               },
              //             ),
              //           )
              //         : ImageFiltered(
              //             imageFilter: ImageFilter.blur(
              //               tileMode: TileMode.decal,
              //               sigmaX: 3.5,
              //               sigmaY: 3.5,
              //             ),
              //             child: DayteCard(
              //               image: 'images/${index + 1}.png',
              //               onPress: () {},
              //             ),
              //           );
              //   },
              // ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Column(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed('/itsadate');
            //         },
            //         child: DayteCard(
            //           image: 'images/1.png',
            //           onPress: () {
            //             cancelDayte(context);
            //           },
            //         ),
            //       ),
            //       DayteCard(
            //         image: 'images/2.png',
            //         onPress: () {
            //           cancelDayte(context);
            //         },
            //       ),
            //       DayteCard(
            //         image: 'images/3.png',
            //         onPress: () {
            //           cancelDayte(context);
            //         },
            //       ),
            //       ImageFiltered(
            //         imageFilter: ImageFilter.blur(
            //           tileMode: TileMode.decal,
            //           sigmaX: 3.5,
            //           sigmaY: 3.5,
            //         ),
            //         child: DayteCard(
            //           image: 'images/2.png',
            //           onPress: () {
            //             cancelDayte(context);
            //           },
            //         ),
            //       ),
            //       // ImageFiltered(
            //       //   imageFilter: ImageFilter.blur(
            //       //     tileMode: TileMode.decal,
            //       //     sigmaX: 3.5,
            //       //     sigmaY: 3.5,
            //       //   ),
            //       //   child: DayteCard(
            //       //     image: 'images/3.png',
            //       //     onPress: () {
            //       //       cancelDayte(context);
            //       //     },
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void cancelDayte(context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      // Drawer from the bottom
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: SizeScreen.height * 0.41,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: SizeScreen.width * 0.8,
                  child: TextWidget(
                      "Are you sure you want to cancel the dayte ?",
                      AppColor.red,
                      20.0,
                      FontWeight.w800,
                      0.0,
                      textalign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO LATER
                      Get.back();
                    },
                    child: GenderSelect(
                      horizontalPadding: 20,
                      textSize: 13,
                      function: () {},
                      borderColor: const Color(0xffe9e7e7),
                      // AppColor.red,
                      checked: const SizedBox(),
                      // SvgPicture.string(doubleCheck)
                      textGender: 'Yes',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO LATER
                      Get.back();
                    },
                    child: GenderSelect(
                      horizontalPadding: 20,
                      textSize: 13,
                      function: () {},
                      borderColor: const Color(0xffe9e7e7),
                      // AppColor.red,
                      checked: const SizedBox(),
                      // SvgPicture.string(doubleCheck)
                      textGender: 'Not sure yet',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO LATER
                      Get.back();
                    },
                    child: GenderSelect(
                      horizontalPadding: 20,
                      textSize: 13,
                      function: () {},
                      borderColor: const Color(0xffe9e7e7),
                      // AppColor.red,
                      checked: const SizedBox(),
                      // SvgPicture.string(doubleCheck)
                      textGender: 'No',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.grey,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("• You will be flagged", AppColor.grey, 14.0,
                          FontWeight.w400, 0.0),
                      const SizedBox(height: 15),
                      TextWidget("• We encourage you to date without fear",
                          AppColor.grey, 14.0, FontWeight.w400, 0.0),
                      const SizedBox(height: 15),
                      TextWidget("• Safety is enforced, strictly",
                          AppColor.grey, 14.0, FontWeight.w400, 0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


class ShimmerLoadingDaytes extends StatelessWidget {
  const ShimmerLoadingDaytes({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!, // Darker gray for base color
      highlightColor: Colors.grey[200]!, // Lighter gray for highlight color
      child: Container(
        width: double.infinity,
        height: 165,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          minWidth: double.infinity,
          maxHeight: 190,
          minHeight: 165,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColor.grey, width: 2.5),
        ),
      ),
    );
  }
}