import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.logInScreen);
      },
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: AppTextStyles.font15BlackMedium,
          children: [
            TextSpan(
              text: 'Login',
              style: TextStyle(color: Appcolors.secondaryColor1),
            ),
          ],
        ),
      ),
    );
  }
}
