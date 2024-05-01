import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kstyles {
  Text reg(
      {required String text,
      Color color = Colors.black,
      double? height,
      bool? softWrap,
      double? size,
      TextOverflow? overflow,
      TextAlign textAlign = TextAlign.start,
      FontWeight? fontWeight}) {
    return Text(
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: GoogleFonts.poppins(
          height: 1.3, fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
