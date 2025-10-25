// ignore_for_file: must_be_immutable

import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormContainer extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isObscureText;
  final bool? isReadOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final String hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final Function(String?) validator;

  const FormContainer({
    super.key,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.isObscureText,
    required this.hintText,
    this.prefixIcon,
    required this.validator,
    this.isReadOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: isReadOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isObscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Appcolors.lightGray, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Appcolors.primaryColor1,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        filled: true,
        fillColor: Appcolors.lightGray,
        hintText: hintText,
        hintStyle: AppTextStyles.font12GrayRegular,
        prefixIcon: prefixIcon != null
            ? Container(
                alignment: Alignment.center,
                width: 20.w,
                height: 20.w,
                child: Image.asset(
                  prefixIcon!,
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.contain,
                  color: Appcolors.gray,
                ),
              )
            : null,
        suffixIcon: suffixIcon,
      ),
      validator: (value) => validator(value),
    );
  }
}
