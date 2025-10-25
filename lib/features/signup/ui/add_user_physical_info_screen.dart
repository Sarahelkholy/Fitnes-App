import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserPhysicalInfo/add_user_physical_info_form.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserPhysicalInfo/add_user_info_image_and_titles.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserPhysicalInfo/user_physical_info_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserPhysicalInfoScreen extends StatelessWidget {
  const AddUserPhysicalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 16.h),
        child: RoundedButton(
          onPressed: () {
            validateThenMoveToChooseGoal(context);
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
              const AddUserPhysicalInfoForm(),
              const UserPhysicalInfoBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenMoveToChooseGoal(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    if (cubit.userInfoFormKey.currentState!.validate()) {
      cubit.emitAddPhysicalInfo(
        cubit.genderController.text,
        cubit.weightController.text,
        cubit.heightController.text,
        cubit.dateOfBirthController.text,
      );

      if (cubit.genderController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose your gender')),
        );
      }
    }
  }
}
