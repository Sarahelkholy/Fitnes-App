import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/signup/ui/widgets/add_user_info_form.dart';
import 'package:fitnestx/features/signup/ui/widgets/add_user_info_image_and_titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserInfoScreen extends StatelessWidget {
  const AddUserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 16.h),
        child: RoundedButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.chooseGoalScreen);
          },
          istextOnly: false,
          buttonChiled: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Next ", style: AppTextStyles.font16WhiteBold),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Appcolors.white,
                size: 18.w,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddUserInfoImageAndTitles(),
              verticalSpace(15),
              AddUserInfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
