import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

const bluishColor = Color(0xFF4e5ae8);
const yellowColor = Color(0xFFFFB746);
const pinkColor = Color(0xFFff4667);
const whiteColor = Colors.white;
const customPrimaryColor = bluishColor;
const darkGreyColor = Color(0xFF121212);
const darkHeaderColor = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: customPrimaryColor,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkGreyColor,
      primaryColor: darkGreyColor,
      brightness: Brightness.dark);
}

TextStyle get headerDateStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get headerDayStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
  );
}

TextStyle get customDateStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey));
}

TextStyle get customDayStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey));
}

TextStyle get customMonthStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey));
}
