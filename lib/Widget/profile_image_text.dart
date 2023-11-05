import 'dart:core';

import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileImageText extends StatelessWidget {
  String? prompt, description, img;

  ProfileImageText({
    super.key,
    this.description,
    this.prompt,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Image.network('$img'),
          const SizedBox(height: 5),
          prompt != null
              ? Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffFCF1F1),
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.5,
                      vertical: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prompt!,
                          style: const TextStyle(
                            fontFamily: "Times",
                            fontSize: 12,
                            color: Color(0xffAB3333),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextWidget(description, const Color(0xff6D6D6D), 13.0,
                            FontWeight.w700, 0.0),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
