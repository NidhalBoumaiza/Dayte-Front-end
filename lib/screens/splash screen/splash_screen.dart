import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../animation/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showWidget1 = false;

  bool _showWidget2 = false;

  void _showWidgetsOneByOne() {
    Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        _showWidget1 = true;
      });
    });
    Timer(const Duration(milliseconds: 2300), () {
      setState(() {
        _showWidget2 = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showWidgetsOneByOne();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SvgPicture.string(
            backgoundFirstScreen,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: _showWidget1,
                    child: AnimationFindIn(
                      child: Center(
                        child: SizedBox(
                          width: SizeScreen.width * 0.85,
                          height: SizeScreen.height * 0.07,
                          child: ElevatedButton(
                            onPressed: () {
                              ///TODO LATER
                              Get.toNamed("/signinsignup");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: AnimationFindIn(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Get Started",
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      FontAwesomeIcons.arrowRight,
                                      color: AppColor.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
