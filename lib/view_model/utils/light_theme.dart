import 'package:flutter/material.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';

ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: AppColors.textColor,
    secondary: AppColors.paige,
    onBackground: Colors.grey[700]!,
  )
);