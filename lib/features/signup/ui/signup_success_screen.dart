import 'package:fitnestx/core/helpers/constants.dart';
import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/helpers/shared_pref_helper.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSuccessScreen extends StatefulWidget {
  const SignupSuccessScreen({super.key});

  @override
  State<SignupSuccessScreen> createState() => _SignupSuccessScreenState();
}

class _SignupSuccessScreenState extends State<SignupSuccessScreen> {
  String name = '';
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final savedName = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    if (mounted) {
      setState(() {
        name = savedName ?? '';
      });
    }
  }

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
              Text('Welcome, $name', style: AppTextStyles.font20BlackSemiBold),
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
            context.pushReplacementNamed(Routes.homeScreen);
          },
          title: 'Go To Home',
          titleTextStyle: AppTextStyles.font16WhiteBold,
        ),
      ),
    );
  }
}
