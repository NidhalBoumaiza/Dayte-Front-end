import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TextWidget(text, color, size, fontweight, letterspacing,
    {TextAlign? textalign , double? height}) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      fontSize: size,
      color: color,
      fontWeight: fontweight,
      letterSpacing: letterspacing,
      height: height ?? 0 ,
    ),
    textAlign: textalign ?? TextAlign.start,

  );
}
