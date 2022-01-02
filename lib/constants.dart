import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final inputDecorationConst = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  labelStyle: GoogleFonts.nunitoSans(
    color: const Color(0xFF909090),
  ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFE0E0E0),
      width: 2,
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF303030),
      width: 2,
    ),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFEB5757),
      width: 2,
    ),
  ),
  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFEB5757),
      width: 2,
    ),
  ),
);
