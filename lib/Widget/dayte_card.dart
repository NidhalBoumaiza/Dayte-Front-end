import 'package:dayte/Widget/continueButton.dart';
import 'package:dayte/Widget/profile_widget.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayteCard extends StatelessWidget {
  void Function() onPress;
  String image;
  String date , time ;
  DayteCard({Key? key, required this.image, required this.onPress ,required this.date  ,required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
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
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              ProfileWidget(
                borderRadious: 9,
                borderColor: Colors.transparent,
                width: 83,
                image: image,
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        "Location", AppColor.red, 14.0, FontWeight.w800, 0.0),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 100,
                      child: TextWidget("Huntington Park", AppColor.black, 13.0,
                          FontWeight.w900, 0.0),
                    ),
                    const SizedBox(height: 5),
                    TextWidget("California", AppColor.black, 13.0,
                        FontWeight.w400, 0.0),
                    const SizedBox(height: 5),
                    TextWidget(
                        "USA", AppColor.black, 13.0, FontWeight.w400, 0.0),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 2.5,
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        "Time", AppColor.red, 14.0, FontWeight.w800, 0.0),
                    const SizedBox(height: 10),
                    TextWidget(
                        time, AppColor.black, 13.0, FontWeight.w900, 0.0),
                    const SizedBox(height: 7),
                    TextWidget(date, AppColor.black, 13.0,
                        FontWeight.w400, 0.0),
                    SizedBox(height: 35),
                    Center(
                      child: ContinueButton(
                        onpress: onPress,
                        width: SizeScreen.width * 0.2,
                        height: SizeScreen.height * 0.028,
                        borderColor: AppColor.red,
                        textColor: AppColor.white,
                        textButton: 'Cancel',
                        textSize: 10,
                        buttonColor: AppColor.red,
                        widget: SizedBox(),
                        borderRadious: 5,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
