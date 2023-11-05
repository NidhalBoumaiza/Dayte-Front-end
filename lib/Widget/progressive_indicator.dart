import 'package:flutter/material.dart';

import '../constant.dart';

Widget progressiveIndicator(color) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: SizedBox(
      height: 12,
      width: 12,
      child: CircularProgressIndicator(
        color: color,
      ),
    ),
  );
}
