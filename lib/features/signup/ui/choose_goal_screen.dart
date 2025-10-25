import 'package:carousel_slider/carousel_slider.dart';

import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/rounded_button.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:fitnestx/features/signup/ui/widgets/chooseGoal/choose_goal_title.dart';
import 'package:fitnestx/features/signup/ui/widgets/chooseGoal/goal_card.dart';
import 'package:fitnestx/features/signup/ui/widgets/sign_up_block_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseGoalScreen extends StatefulWidget {
  const ChooseGoalScreen({super.key});

  @override
  State<ChooseGoalScreen> createState() => _ChooseGoalScreenState();
}

class _ChooseGoalScreenState extends State<ChooseGoalScreen> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ChooseGoalTitle(), GoalCard(), SignUpBlocListener()],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 16.h),
        child: RoundedButton(
          onPressed: () {
            context.read<SignUpCubit>().emitSignupStates();
          },
          title: 'Confirm',
          titleTextStyle: AppTextStyles.font16WhiteBold,
        ),
      ),
    );
  }
}
