import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/signup/signup_successfully.png",
                fit: BoxFit.fitWidth,
              ),
              verticalSpace(20),
              Text(
                'Welcome, Stefani',
                style: AppTextStyles.font20BlackRegular.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpace(6),
              Text(
                'You are all set now, let’s reach your\n goals together with us',
                textAlign: TextAlign.center,
                style: AppTextStyles.font12GrayRegular,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 16.h),
        child: RoundedButton(
          onPressed: () {
            //     context.pushReplacementNamed(Routes.mainTabScreen);
          },
          title: 'Go To Home',
          titleTextStyle: AppTextStyles.font16WhiteBold,
        ),
      ),
    );
  }
}
