import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scripts_task/shared/style/app_pallete.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "Roboto",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return AppPalette.primaryColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppPalette.primaryColor;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.red;
            }
            return AppPalette.inactiveColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            }
            return AppPalette.primaryColor;
          },
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppPalette.primaryColor,
        ),
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
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppPalette.primaryColor,
      ),
      bodyText2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w700,
        color: AppPalette.primaryColor,
      ),
      headline1: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        color: AppPalette.primaryColor,
      ),
      headline2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: AppPalette.primaryColor,
      ),
      headline3: TextStyle(
        fontSize: 9.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w700,
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
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.only(right: 10, left: 10, top: 13, bottom: 0),
    fillColor: Color(0xffF5F5F5),
    filled: true,
    errorMaxLines: 2,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 240, 24, 8)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 240, 24, 8)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
