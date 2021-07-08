import 'package:flutter/material.dart';
import './constant/colors.dart';
import './constant/fonts.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: ColorsApp.primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: FontApp.textTheme,
  appBarTheme: AppBarTheme(
    textTheme: FontApp.textTheme.apply(bodyColor: Colors.white),
    elevation: 0,
  ),
);
