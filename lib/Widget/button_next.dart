import 'package:flutter/material.dart';

import '../constant.dart';

Widget ButtonNext(width, height, function, buttonColor, text,
    {double? circularRadious, Widget? widget}) {
  return SizedBox(
    width: width,
    height: height,
    child: AbsorbPointer(
      absorbing: false,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: buttonColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadious ?? 10),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.2,
                ),
              ),
              widget ?? SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}
