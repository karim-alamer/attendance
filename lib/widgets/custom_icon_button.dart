import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      31.h,
                    ),
                    topRight: Radius.circular(
                      30.h,
                    ),
                    bottomLeft: Radius.circular(
                      31.h,
                    ),
                    bottomRight: Radius.circular(
                      30.h,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 1),
                    end: Alignment(0.5, 0),
                    colors: [
                      appTheme.deepOrange10001,
                      appTheme.deepOrange100,
                    ],
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue50,
        borderRadius: BorderRadius.circular(16.h),
      );
}
