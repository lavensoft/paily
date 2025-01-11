import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.light,

    primaryColor: CupertinoColors.activeBlue,

    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),

    //#region Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: CupertinoColors.activeBlue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadiusTheme.childRadius,
        ),
        foregroundColor: Colors.white,
      ),
    ),
    //#endregion

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadiusTheme.containerRadius,
      ),
    ),

    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 1,
      color: Color.fromRGBO(0, 0, 0, .12),
    ),

    colorScheme: ColorScheme.light(
      primary: CupertinoColors.activeBlue,
      primaryContainer: CupertinoColors.activeBlue.withOpacity(.06),

      secondary: CupertinoColors.activeGreen,

      surface: Colors.white,

      onSurface: Colors.black, // Text color
      onSurfaceVariant: CupertinoColors.systemGrey, //Text color secondary
      
      outline: CupertinoColors.systemGrey5,

      surfaceContainerLowest: Color.fromRGBO(0, 0, 0, .03), // Background color secondary
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 39,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      )
    ),
  );
}