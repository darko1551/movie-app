import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: MovieAppColors.darkBlue,
      scaffoldBackgroundColor: MovieAppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: MovieAppColors.white,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: MovieAppColors.darkBlue,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: MovieAppColors.darkBlue,
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: MovieAppColors.grey,
          fontSize: 12,
        ),
        labelMedium: TextStyle(
          color: MovieAppColors.black,
          fontSize: 12,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          color: MovieAppColors.grey,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: WidgetStateProperty.all(
            32,
          ),
          iconColor: WidgetStateProperty.all(
            MovieAppColors.darkBlue,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: MovieAppColors.darkBlue,
      ),
      switchTheme: SwitchThemeData(
        // Track (background) color based on switch state
        trackColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) return MovieAppColors.darkBlue;
            return MovieAppColors.white;
          },
        ),
        // Thumb (circle) color based on switch state
        thumbColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) return Colors.blue;
            return MovieAppColors.buttonTextGray;
          },
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: MovieAppColors.lightBlue,
      scaffoldBackgroundColor: MovieAppColors.darkGray,
      appBarTheme: AppBarTheme(
        backgroundColor: MovieAppColors.darkGray,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: MovieAppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: MovieAppColors.lightBlue,
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: MovieAppColors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: MovieAppColors.white,
        ),
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: MovieAppColors.white,
        ),
        bodyMedium: TextStyle(
          color: MovieAppColors.lightGrey,
          fontSize: 12,
        ),
        labelMedium: TextStyle(
          color: MovieAppColors.white,
          fontSize: 12,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          color: MovieAppColors.lightGrey,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: WidgetStateProperty.all(32),
          iconColor: WidgetStateProperty.all(MovieAppColors.lightBlue),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MovieAppColors.darkGray,
        selectedItemColor: MovieAppColors.white,
      ),
      switchTheme: SwitchThemeData(
        // Track (background) color based on switch state
        trackColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) return MovieAppColors.white;
            return Colors.grey.shade400;
          },
        ),
        // Thumb (circle) color based on switch state
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return MovieAppColors.mediumBlue;
          return Colors.white;
        }),
      ),
    );
