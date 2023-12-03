import 'package:dayte/Widget/continueButton.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Widget/profile_widget.dart';
import '../controller/controller_mother_screen.dart';

class PetalsScreen extends StatefulWidget {
  const PetalsScreen({Key? key}) : super(key: key);

  @override
  State<PetalsScreen> createState() => _PetalsScreenState();
}

class _PetalsScreenState extends State<PetalsScreen> {
  var controllerHome = Get.put(MotherScreenController());
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = controllerHome.getHomeSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget('Petals', AppColor.red, 35.0, FontWeight.w800, 0.5),
            TextWidget(
                'Select 3 profiles', AppColor.grey, 14.0, FontWeight.w400, 0.0),
            SvgPicture.string(today),
            FutureBuilder(
              future: future,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: ShimmerLoadingPetals());
                } else {
                  return Obx(
                    () => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:
                            SizeScreen.height * 0.1 / SizeScreen.width * 3,

                        ///TODO: change by plan
                        crossAxisCount: 3,
                        // Number of columns in the grid ///TODO: change by plan
                        crossAxisSpacing: 8.0,
                        // Spacing between columns
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: controllerHome.listSuggestions.length,
                      // Total number of items
                      itemBuilder: (BuildContext context, int index) {
                        // Build each grid item
                        // TODO LATER WITH API ShimmerLoadingPetals()
                        print(controllerHome.listSuggestions[index].id);
                        if (controllerHome.isLoading.value == true) {
                          return ShimmerLoadingPetals();
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/profiledetail', arguments: {
                                "index": index,
                              });
                            },
                            child: ProfileWidget(
                              name: controllerHome.listSuggestions[index].name
                                  ?.split(" ")[0],
                              image:
                                  ("${dotenv.env['URL']}${controllerHome.listSuggestions[index].pictures?[0]}"),
                              age: controllerHome.listSuggestions[index].age
                                  .toString(),
                            ),
                          );
                        }
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: ContinueButton(
                onpress: () {
                  Get.toNamed("accountsteptwo");
                },
                width: SizeScreen.width * 0.28,
                height: SizeScreen.height * 0.04,
                borderColor: AppColor.red,
                textColor: AppColor.red,
                textButton: 'Shuffle',
                textSize: 13,
                widget: SvgPicture.string(shuffle),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingPetals extends StatelessWidget {
  const ShimmerLoadingPetals({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!, // Darker gray for base color
      highlightColor: Colors.grey[200]!, // Lighter gray for highlight color
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
