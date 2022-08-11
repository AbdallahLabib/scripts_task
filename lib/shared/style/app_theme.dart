import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "Roboto",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppPalette.primaryColor,
    dividerColor: Colors.black.withOpacity(0.05),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      titleSpacing: 19.0,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: AppPalette.primaryColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.3,
      ),
      subtitle2: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 0),
    fillColor: Color(0xffF8F8F8),
    filled: true,
    errorMaxLines: 2,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppPalette.primaryColor),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppPalette.primaryColor),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 240, 24, 8)),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 240, 24, 8)),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );
}
