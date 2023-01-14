import 'package:flutter/material.dart';

ThemeData light() => ThemeData(

      primaryColor: Colors.black,
      secondaryHeaderColor:  Colors.black,
      disabledColor: Colors.grey.withOpacity(0.5),
      backgroundColor: Color(0xFFFfffff),
      scaffoldBackgroundColor:Colors.white,
      errorColor: Color(0xFFE84D4F),
      brightness: Brightness.light,
      hintColor: Color(0xFF9F9F9F),
      cardColor: Colors.white,
      colorScheme: ColorScheme.light(primary: Colors.black, secondary: Colors.black),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.black)),
    );
