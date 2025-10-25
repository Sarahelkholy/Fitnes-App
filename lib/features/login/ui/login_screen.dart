import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/login/ui/widgets/do_not_have_an_account.dart';
import 'package:fitnestx/features/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                Text('Welcome Back', style: AppTextStyles.font24BlackBold),
                verticalSpace(25),
                LoginForm(),
                // GestureDetector(
                //   // TODO: add function
                //   onTap: () {},
                //   child: Text(
                //     "Forgot your password?",
                //     style: AppTextStyles.font12Gray.copyWith(
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
                verticalSpace(40),
                RoundedButton(
                  istextOnly: false,
                  onPressed: () {
                    // context.pushReplacementNamed(Routes.mainTabScreen);
                  },
                  buttonChiled: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/Login.png",
                        width: 25.w,
                        height: 25.w,
                        fit: BoxFit.contain,
                      ),
                      Text(" Login", style: AppTextStyles.font16WhiteBold),
                    ],
                  ),
                ),
                verticalSpace(18),

                DoNotHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
