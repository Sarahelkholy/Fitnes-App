// ignore_for_file: must_be_immutable

import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;

  final List<Color>? color;
  final Color? backgroundColor;
  final bool? gradiant;
  final VoidCallback onPressed;
  final bool? istextOnly;
  final Widget? buttonChiled;
  const RoundedButton({
    super.key,
    this.title,
    required this.onPressed,
    this.color,
    this.gradiant,
    this.backgroundColor,
    this.titleTextStyle,
    this.istextOnly,
    this.buttonChiled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradiant ?? true
            ? LinearGradient(
                colors: color ?? Appcolors.primaryG,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )
            : null,
        borderRadius: BorderRadius.circular(50.r),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        minWidth: double.maxFinite,
        child: istextOnly ?? true
            ? Text(title!, style: titleTextStyle)
            : buttonChiled,
      ),
    );
  }
}
