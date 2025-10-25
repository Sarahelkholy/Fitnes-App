import 'package:fitnestx/core/helpers/app_regex.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/widgets/form_container.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: Column(
        children: [
          FormContainer(
            controller: emailController,
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
}
