import 'package:flutter/material.dart';

import '../constant.dart';

class TextFieldWidget extends StatelessWidget {
  void Function(String) function;
  TextInputType keyboardType;
  String hint;
  bool? enabled, obsecuretext;
  InputDecoration? inputdecoration;
  TextEditingController? controller;
  int? maxLines, minLines;
  Color? colorText;

  TextFieldWidget(
      {Key? key,
      required this.function,
      required this.hint,
      required this.keyboardType,
      this.controller,
      this.enabled,
      this.inputdecoration,
      this.obsecuretext,
      this.maxLines,
      this.minLines,
      this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      enabled: enabled ?? true,
      obscureText: obsecuretext ?? false,
      controller: controller,
      //textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      onChanged: function,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: colorText ?? AppColor.black,
        fontSize: 15,
      ),
      textAlign: TextAlign.start,

      decoration: inputdecoration ??
          KinputDecoration.copyWith(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
    );
  }
}
