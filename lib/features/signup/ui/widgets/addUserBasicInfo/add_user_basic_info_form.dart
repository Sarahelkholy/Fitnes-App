import 'package:fitnestx/core/helpers/app_regex.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/widgets/form_container.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserBasicInfoForm extends StatefulWidget {
  const AddUserBasicInfoForm({super.key});

  @override
  State<AddUserBasicInfoForm> createState() => _AddUserBasicInfoFormState();
}

class _AddUserBasicInfoFormState extends State<AddUserBasicInfoForm> {
  bool isPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().basicInfoFormKey,
      child: Column(
        children: [
          FormContainer(
            controller: context.read<SignUpCubit>().nameController,
            prefixIcon: 'assets/icons/Profile.png',
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
          ),
          verticalSpace(18),
          FormContainer(
            controller: context.read<SignUpCubit>().emailController,
            prefixIcon: 'assets/icons/Email.png',
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          FormContainer(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<SignUpCubit>().passwordController,
            isObscureText: isPasswordObscureText,
            prefixIcon: 'assets/icons/Password.png',
            hintText: 'Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                color: Appcolors.gray,

                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
