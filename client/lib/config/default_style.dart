import 'package:flutter/material.dart';

ThemeData defaultStyle = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.blue,
      foregroundColor: Colors.white,
    ),
    dataTableTheme: const DataTableThemeData().copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData().copyWith(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle().copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStatePropertyAll(Colors.white)),
    ),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.blue)));

const serverUrl = 'http://192.168.0.16:8000';
