import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/features/signup/data/choose_goal_data.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalCard extends StatefulWidget {
  const GoalCard({super.key});

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: CarouselSlider(
          items: chooseGoalPageContent
              .map(
                (goal) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: Appcolors.primaryG,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        goal['image'].toString(),
                        fit: BoxFit.fitWidth,
                      ),
                      verticalSpace(10),
                      Text(
                        goal['title'].toString(),
                        style: AppTextStyles.font14WhiteBold,
                      ),
                      Text(
                        goal['subtitle'].toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font12WhiteRegular,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
            aspectRatio: 0.65,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });

              final cubit = context.read<SignUpCubit>();
              final selectedGoal = chooseGoalPageContent[index]['goal']
                  .toString();
              cubit.goalController.text = selectedGoal;

              cubit.updateGoal(selectedGoal);
              print(selectedGoal);
            },
          ),
        ),
      ),
    );
  }
}
