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
  static TextStyle font20BlackRegular = TextStyle(
    color: Appcolors.black,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font20BlackSemiBold = TextStyle(
    color: Appcolors.black,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16BlackBold = TextStyle(
    color: Appcolors.black,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font14GrayRegular = TextStyle(
    color: Appcolors.gray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font12GrayRegular = TextStyle(
    color: Appcolors.gray,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12WhiteRegular = TextStyle(
    color: Appcolors.white,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14WhiteBold = TextStyle(
    fontSize: 14.sp,
    color: Appcolors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font15WhiteMedium = TextStyle(
    color: Appcolors.white,
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    color: Appcolors.white,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font12GrayMedium = TextStyle(
    color: Appcolors.gray,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15.sp,
    color: Appcolors.black,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16primaryColor1Regular = TextStyle(
    color: Appcolors.primaryColor1,
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14primaryColor1 = TextStyle(
    fontSize: 14,
    color: Appcolors.primaryColor1,
  );

  static TextStyle font12BlackBold = TextStyle(
    color: Appcolors.black,
    fontWeight: FontWeightHelper.bold,
    fontSize: 12,
  );

  static TextStyle font14BlackBold = TextStyle(
    color: Appcolors.black,
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
  );
}
