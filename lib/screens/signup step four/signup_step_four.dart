import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/card_of_pack.dart';
import '../signup step one/controller/controller_signup.dart';

class SignupStepFour extends StatefulWidget {
  const SignupStepFour({Key? key}) : super(key: key);

  @override
  State<SignupStepFour> createState() => _SignupStepFourState();
}

class _SignupStepFourState extends State<SignupStepFour> {
  @override
  var signupcontroller = Get.find<SignUpController>();

  bool c1 = false;
  bool c2 = false;

  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: TextWidget(
                      'Dayte plans', AppColor.red, 30.0, FontWeight.w800, 0.0),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      signupcontroller.changePack(
                          signupcontroller.pack2, signupcontroller.pack1);
                      // setState(() {
                      //   if (c2) {
                      //     c2 = false;
                      //   }
                      //   c1 = !c1;
                      // });
                    },
                    child: PriceCard(
                      packName: "Basic",
                      price: "\$9.99/mth",
                      text1: "3 x 3 grid",
                      text2: "2 possible Dayte’s monthly",
                      text3: "3 daily likes",
                      tick: signupcontroller.pack1.value
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: AppColor.red,
                            )
                          : SizedBox(),
                      borderColor: signupcontroller.pack1.value
                          ? AppColor.red
                          : AppColor.grey,
                      borderWidth: signupcontroller.pack1.value ? 2 : 1,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    signupcontroller.changePack(
                        signupcontroller.pack1, signupcontroller.pack2);
                    // setState(() {
                    //   if (c1) {
                    //     c1 = false;
                    //   }
                    //   c2 = !c2;
                    // });
                  },
                  child: Obx(
                    () => PriceCard(
                      packName: "Premium",
                      price: "\$14.99/mth",
                      text1: "3 x 4 grid",
                      text2: "4 possible Dayte’s monthly",
                      text3: "5 daily likes",
                      tick: signupcontroller.pack2.value
                          ? Icon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: AppColor.red,
                            )
                          : SizedBox(),
                      borderColor: signupcontroller.pack2.value
                          ? AppColor.red
                          : AppColor.grey,
                      borderWidth: signupcontroller.pack2.value ? 2 : 1,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/accountstepone');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget("Try before I pay ", AppColor.grey, 14.0,
                          FontWeight.w500, 0.0),
                      SizedBox(
                        height: 10,
                        child: SvgPicture.string(littleArrow),
                      )
                    ],
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
