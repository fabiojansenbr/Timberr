import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kOffBlack = Color(0xFF303030);
const kLeadBlack = Color(0xFF212121);
const kRaisinBlack = Color(0xFF222222);
const kGrey = Color(0xFF808080);
const kTinGrey = Color(0xFF909090);
const kGraniteGrey = Color(0xFF606060);
const kBasaltGrey = Color(0xFF999999);
const kTrolleyGrey = Color(0xFF828282);
const kNoghreiSilver = Color(0xFFBDBDBD);
const kChristmasSilver = Color(0xFFE0E0E0);
const kLynxWhite = Color(0xFFF7F7F7);
const kSnowFlakeWhite = Color(0xFFF0F0F0);
const kSeaGreen = Color(0xFF2AA952);
const kCrayolaGreen = Color(0xFF27AE60);
const kFireOpal = Color(0xFFEB5757);

final kMerriweatherBold = GoogleFonts.merriweather(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kOffBlack,
);

final inputDecorationConst = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  labelStyle: GoogleFonts.nunitoSans(
    color: kTinGrey,
  ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: kChristmasSilver,
      width: 2,
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: kOffBlack,
      width: 2,
    ),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: kFireOpal,
      width: 2,
    ),
  ),
  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: kFireOpal,
      width: 2,
    ),
  ),
);
