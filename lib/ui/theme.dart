import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bluishColor = Color(0xFF4e5ae8);
const yellowColor = Color(0xFFFFB746);
const pinkColor = Color(0xFFff4667);
const whiteColor = Colors.white;
const customPrimaryColor = bluishColor;
const darkGreyColor = Color(0xFF121212);
const darkHeaderColor = Color(0xFF424242);

class Themes {
  static final light =
      ThemeData(primaryColor: customPrimaryColor, brightness: Brightness.light);
  static final dark =
      ThemeData(primaryColor: darkGreyColor, brightness: Brightness.dark);
}
