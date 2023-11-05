import 'package:dayte/constant.dart';
import 'package:dayte/solution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItsADateScreen extends StatelessWidget {
  const ItsADateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;

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
            padding: const EdgeInsets.fromLTRB(2.0, 20, 2, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 550,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 80,
                        right: 30,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()
                            ..rotateZ(15 * 6.1415927 / 500),
                          child: Container(
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${dotenv.env["URL"]}${arguments['myPicture']}'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        left: 45,
                        child: SvgPicture.string(flower),
                      ),
                      Positioned(
                        top: 210,
                        left: 30,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()
                            ..rotateZ(-15 * 6.1415927 / 500),
                          child: Container(
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${dotenv.env["URL"]}${arguments['picture']}'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -100,
                        left: -40,
                        child: SvgPicture.string(flower),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.string(ItsADateText),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/availability');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 30),
                    child: SvgPicture.string(arrow),
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
