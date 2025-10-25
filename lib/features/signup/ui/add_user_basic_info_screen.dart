import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserBasicInfo/already_have_an_account_text.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserBasicInfo/user_basic_info_bloc_listener.dart';
import 'package:fitnestx/features/signup/ui/widgets/addUserBasicInfo/add_user_basic_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserBasicInfoScreen extends StatelessWidget {
  const AddUserBasicInfoScreen({super.key});

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

                const AddUserBasicInfoForm(),
                verticalSpace(40),

                RoundedButton(
                  title: 'Register',
                  titleTextStyle: AppTextStyles.font16WhiteBold,
                  onPressed: () {
                    validateThenMoveToUserPhysicalInfo(context);
                  },
                ),
                verticalSpace(18),

                const AlreadyHaveAnAccountText(),
                const UserBasicInfoBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenMoveToUserPhysicalInfo(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    final isValid = cubit.basicInfoFormKey.currentState!.validate();
    if (isValid) {
      cubit.emitAddBasicInfo(
        cubit.nameController.text,
        cubit.emailController.text,
        cubit.passwordController.text,
      );
    }
  }
}
