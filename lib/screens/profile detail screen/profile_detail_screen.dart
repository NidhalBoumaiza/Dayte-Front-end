import 'package:dayte/Widget/interest_widget.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/profile_image_text.dart';
import '../../constant.dart';
import '../mother screen/controller/controller_mother_screen.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments; // arguments["index"]
    final index = arguments["index"];

    var controllerHome = Get.find<MotherScreenController>();

    return SafeArea(
        child: Stack(
      children: [
        SvgPicture.string(
          backgroundEmpty,
          fit: BoxFit.cover,
        ),
        Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25),
              child: FloatingActionButton(
                highlightElevation: 0,
                hoverColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverElevation: 0,
                focusColor: Colors.transparent,
                focusElevation: 0,
                disabledElevation: 0,
                elevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.string(arrowBack),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeScreen.height * 0.635,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '${dotenv.env['URL']}${controllerHome.listSuggestions.value[index].pictures?[0]}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeScreen.height * 0.59,
                      child: Container(
                        width: SizeScreen.width * 1,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 23,
                      top: SizeScreen.height * 0.56,
                      child: Obx(
                        () => GestureDetector(
                          onTap: controllerHome.listSuggestions.value[index]
                                      .liked?.value ==
                                  false
                              ? () {
                                  print(controllerHome.listSuggestions
                                      .value[index].liked?.value);
                                  controllerHome.likeProfile(
                                    index,
                                    context,
                                  );
                                }
                              : null,
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: controllerHome.listSuggestions.value[index]
                                          .liked?.value ==
                                      false
                                  ? const Color(0xffAB3333)
                                  : Colors.grey.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 38,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          "${controllerHome.listSuggestions.value[index].name}, ${controllerHome.listSuggestions.value[index].age}",
                          AppColor.black,
                          20.0,
                          FontWeight.w800,
                          0.0),
                      const SizedBox(height: 5),
                      TextWidget(
                          "${controllerHome.listSuggestions.value[index].gender}",
                          AppColor.grey,
                          11.0,
                          FontWeight.w300,
                          0.0),
                      const SizedBox(height: 5),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: const Color(0xffFCF1F1),
                      //       borderRadius: BorderRadius.circular(5)),
                      //   width: double.infinity,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 4.5,
                      //       vertical: 10,
                      //     ),
                      //     child: TextWidget(
                      //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget urna non est luctus proin. Nibh nisi montes, nisi, in ultrices justo, varius volutpat.",
                      //         AppColor.grey,
                      //         12.0,
                      //         FontWeight.w200,
                      //         0.0),
                      //   ),
                      // ),
                      const SizedBox(height: 5),
                      TextWidget("Interestes", const Color(0xff595959), 16.0,
                          FontWeight.w500, 0.0),
                      const SizedBox(height: 5),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controllerHome
                              .listSuggestions.value[index].interests?.length,
                          itemBuilder: (BuildContext context, int i) {
                            return InterestWidget(
                              icon: FontAwesomeIcons.book,
                              interest:
                                  "${controllerHome.listSuggestions.value[index].interests?[i]}",
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controllerHome.listSuggestions.value[index]
                                          .pictures!.length -
                                      1 >
                                  controllerHome.listSuggestions.value[index]
                                      .prompts!.length
                              ? controllerHome.listSuggestions.value[index]
                                      .pictures!.length -
                                  1
                              : controllerHome
                                  .listSuggestions.value[index].prompts?.length,
                          // The number of items in your list
                          itemBuilder: (BuildContext context, int indexx) {
                            print(controllerHome
                                .listSuggestions.value[index].prompts!.length);
                            return ProfileImageText(
                              description: controllerHome.listSuggestions
                                          .value[index].prompts!.isNotEmpty &&
                                      controllerHome.listSuggestions
                                              .value[index].prompts!.length <=
                                          index
                                  ? controllerHome.listSuggestions.value[index]
                                      .prompts![indexx].answer
                                  : null,
                              prompt: controllerHome.listSuggestions
                                              .value[index].prompts!.length >
                                          0 &&
                                      controllerHome.listSuggestions
                                              .value[index].prompts!.length <=
                                          index
                                  ? controllerHome.listSuggestions.value[index]
                                      .prompts![indexx].prompt
                                  : null,
                              img:
                                  '${dotenv.env['URL']}${controllerHome.listSuggestions.value[index].pictures?[indexx + 1]}',
                            );
                          }),
                      const SizedBox(height: 20),
                      Center(
                        child: TextWidget(
                            "${controllerHome.listSuggestions.value[index].name?.split(" ")[0]}’s profile",
                            AppColor.black,
                            15.0,
                            FontWeight.w900,
                            0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
