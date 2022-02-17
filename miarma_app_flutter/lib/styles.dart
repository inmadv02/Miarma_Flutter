import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Color azulMenu = Color.fromRGBO(56, 151, 241, 1);
  static const Color azulLetraLogin = Color.fromARGB(255, 0, 34, 66);

  static TextStyle textTitleCustom(double size) => GoogleFonts.getFont(
        'Lobster Two',
        color: Colors.black,
        fontSize: size,
        fontWeight: FontWeight.w600,
      );
}
