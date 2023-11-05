import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  bool? d;
  String text;
  Function()? onPress;
  Function(bool?)? onChange;

  CheckboxWidget(
      {Key? key,
      required this.text,
      this.onPress,
      this.onChange,
      this.d = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: const BorderSide(
                      color: Color(0xffADA9A9),
                      width: 2,
                    ),
                    splashRadius: 0,
                    value: d!,
                    onChanged: onChange,
                    activeColor: const Color(0xffADA9A9),
                    checkColor: AppColor.red,
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: onPress,
                    child: SizedBox(
                      child: TextWidget(text, const Color(0xff7C7C7C), 16.0,
                          FontWeight.w500, 0.0),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Color(0xff7C7C7C),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
