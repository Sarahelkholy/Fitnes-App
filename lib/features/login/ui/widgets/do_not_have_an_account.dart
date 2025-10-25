import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.addUserBasicInfoScreen);
      },
      child: RichText(
        text: TextSpan(
          text: 'Don’t have an account yet? ',
          style: AppTextStyles.font15BlackMedium,
          children: [
            TextSpan(
              text: 'Register',
              style: TextStyle(color: Appcolors.secondaryColor1),
            ),
          ],
        ),
      ),
    );
  }
}
