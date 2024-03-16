import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:flutter/material.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeRubikGray800 => theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.gray800,
        fontSize: 18.fSize,
      );
  // Title text style
  static get titleMediumInterGray50 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterGray70001 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray70001,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterGray90001 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get ropaSans {
    return copyWith(
      fontFamily: 'Ropa Sans',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }
}
