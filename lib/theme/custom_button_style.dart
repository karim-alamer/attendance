import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:flutter/material.dart';


/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillLightBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlue90001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientBlueGrayToIndigoDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueGray800,
            appTheme.indigo300,
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
