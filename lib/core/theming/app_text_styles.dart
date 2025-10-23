import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle font24BlackBold = TextStyle(
    color: Appcolors.black,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font14GrayRegular = TextStyle(
    color: Appcolors.gray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20Black = TextStyle(
    color: Appcolors.black,
    fontSize: 20.sp,
  );

  static TextStyle font12White = TextStyle(
    color: Appcolors.white,
    fontSize: 12,
  );

  static TextStyle font16White700Weight = TextStyle(
    fontSize: 16.sp,
    color: Appcolors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font12Gray500Weight = TextStyle(
    color: Appcolors.gray,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font15Black500Weight = TextStyle(
    fontSize: 15.sp,
    color: Appcolors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16primaryColor1400Weight = TextStyle(
    color: Appcolors.primaryColor1,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font14primaryColor1 = TextStyle(
    fontSize: 14,
    color: Appcolors.primaryColor1,
  );

  static TextStyle font16Black700Weight = TextStyle(
    color: Appcolors.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font14White700Weight = TextStyle(
    color: Appcolors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font12Black700Weight = TextStyle(
    color: Appcolors.black,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  static TextStyle font14Black700Weight = TextStyle(
    color: Appcolors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font12Gray = TextStyle(
    color: Appcolors.gray,
    fontSize: 12.sp,
  );
}
