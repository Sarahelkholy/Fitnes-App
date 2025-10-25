import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChooseGoalTitle extends StatelessWidget {
  const ChooseGoalTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('What is your goal ?', style: AppTextStyles.font20BlackSemiBold),
        verticalSpace(7),
        Text(
          'It will help us to choose a best\n program for you',
          textAlign: TextAlign.center,
          style: AppTextStyles.font12GrayRegular,
        ),
        verticalSpace(20),
      ],
    );
  }
}
