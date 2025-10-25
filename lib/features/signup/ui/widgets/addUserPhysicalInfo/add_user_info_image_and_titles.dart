import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddUserInfoImageAndTitles extends StatelessWidget {
  const AddUserInfoImageAndTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/signup/addUserInfo.png',
          fit: BoxFit.fitWidth,
        ),
        verticalSpace(15),
        Text(
          textAlign: TextAlign.center,
          'Let’s complete your profile',
          style: AppTextStyles.font16BlackBold,
        ),
        verticalSpace(10),
        Text(
          'It will help us to know more about you!',
          style: AppTextStyles.font12GrayRegular,
        ),
      ],
    );
  }
}
