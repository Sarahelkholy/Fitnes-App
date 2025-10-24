import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/widgets/form_container.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscureText = true;
  bool isConfirmPasswordObscureText = true;

  @override
  void initState() {
    super.initState();
    // passwordController = context.read<SignUpCubit>().passwordController;
    // setupPasswordControllerlistener();
  }

  // void setupPasswordControllerlistener() {
  //   passwordController.addListener(() {
  //     setState(() {
  //       hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
  //       hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
  //       hasSpecialCharacter = AppRegex.hasSpecialCharacter(
  //         passwordController.text,
  //       );
  //       hasNumber = AppRegex.hasNumber(passwordController.text);
  //       hasMinLength = AppRegex.hasMinLength(passwordController.text);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      //    key: formKey,
      child: Column(
        children: [
          FormContainer(
            controller: firstNameController,
            prefixIcon: 'assets/icons/Profile.png',
            hintText: 'First Name',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid first name';
              }
            },
          ),
          verticalSpace(18),
          FormContainer(
            controller: lastNameController,
            prefixIcon: 'assets/icons/Profile.png',
            hintText: 'Last Name',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid last name';
              }
            },
          ),
          verticalSpace(18),
          FormContainer(
            controller: emailController,
            prefixIcon: 'assets/icons/Email.png',
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          FormContainer(
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid password';
              }
            },
            controller: passwordController,
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

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
