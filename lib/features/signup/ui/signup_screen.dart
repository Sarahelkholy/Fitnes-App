import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/signup/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Hey there,', style: AppTextStyles.font20BlackRegular),
                Text('Create an Account', style: AppTextStyles.font24BlackBold),
                verticalSpace(25),

                SignUpForm(),
                verticalSpace(40),

                RoundedButton(
                  title: 'Register',
                  titleTextStyle: AppTextStyles.font16WhiteBold,
                  onPressed: () {
                    context.pushReplacementNamed(Routes.addUserInfoScreen);
                  },
                ),
                verticalSpace(18),

                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.logInScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.font15Black500Weight,
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Appcolors.secondaryColor1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
