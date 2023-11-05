import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class PriceCard extends StatelessWidget {
  String? packName, price, text1, text2, text3;
  Widget? tick;
  Color? borderColor;
  double? borderWidth;
  PriceCard({
    Key? key,
    this.packName,
    this.price,
    this.text1,
    this.text2,
    this.text3,
    this.tick,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeScreen.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!,
          width: borderWidth!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(packName, AppColor.grey, 17.0, FontWeight.w600, 0.0),
                tick!,
                // Icon(
                //   FontAwesomeIcons.solidCircleCheck,
                //   color: Colors.green,
                //   size: 20,
                // ),
              ],
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(price, AppColor.grey, 23.0, FontWeight.w800, 0.0),
                  const SizedBox(height: 15),
                  rowCard(text1),
                  const SizedBox(height: 15),
                  rowCard(text2),
                  const SizedBox(height: 15),
                  rowCard(text3),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget rowCard(text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(
        FontAwesomeIcons.solidCircleCheck,
        color: AppColor.red,
        size: 18,
      ),
      const SizedBox(width: 10),
      TextWidget(text, AppColor.grey, 14.0, FontWeight.w400, 0.0),
    ],
  );
}
