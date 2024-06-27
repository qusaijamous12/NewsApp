import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme()=>ThemeData(
    primarySwatch: Colors.deepOrange,
    iconTheme: IconThemeData(
        color: Colors.black
    ),

    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.black
        )
    )
);

ThemeData darkTheme()=>ThemeData(
    primarySwatch: Colors.grey,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.light
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.white
        )
    )




);