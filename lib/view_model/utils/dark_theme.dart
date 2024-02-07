import 'package:flutter/material.dart';
import 'package:mr_azmi/view_model/utils/app_colors.dart';

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color:AppColors.black ),
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    background:AppColors.blackDegree,
    primary: Colors.grey[800]!,
    secondary: Colors.grey[700]!,
    onBackground: Colors.grey[600]!,
  )
);