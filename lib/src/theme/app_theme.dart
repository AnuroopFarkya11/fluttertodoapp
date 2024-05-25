import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertodoapp/src/constants/app_colors.dart';

class AppTheme {

  final AppColors appColors = AppColors();


  ThemeData get lgt => ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.light(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      )
    )


  );

  ThemeData get drk => FlexThemeData.dark(scheme: FlexScheme.bigStone,useMaterial3: true,).copyWith(

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      constraints: const BoxConstraints(maxHeight: 60),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: TextStyle(fontSize: 16),



    ),

    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.white10
    ))
  );





}
