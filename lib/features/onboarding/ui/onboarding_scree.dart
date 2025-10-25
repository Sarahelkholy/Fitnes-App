import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/routing/routes.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/features/onboarding/data/onboarding_data.dart';
import 'package:fitnestx/features/onboarding/ui/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _controller;
  int _selectedPage = 0;

  int get _totalPages => onboardingPagesContent.length;

  bool get _isLastPage => _selectedPage == _totalPages - 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_isLastPage) {
      context.pushReplacementNamed(Routes.addUserBasicInfoScreen);
      return;
    }
    final next = (_selectedPage + 1).clamp(0, _totalPages - 1);
    _controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    //progress mesure
    final progress = _totalPages == 0 ? 0.0 : (_selectedPage + 1) / _totalPages;

    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: _totalPages,
              onPageChanged: (index) {
                if (_selectedPage != index) {
                  setState(() => _selectedPage = index);
                }
              },
              itemBuilder: (context, index) {
                final pageContent =
                    (onboardingPagesContent[index] as Map?) ?? {};
                return OnBoardingContent(pageContent: pageContent);
              },
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 24.h,
            child: _ProgressNextButton(
              progress: progress,
              isLastPage: _isLastPage,
              onPressed: _goNext,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressNextButton extends StatelessWidget {
  const _ProgressNextButton({
    required this.progress,
    required this.isLastPage,
    required this.onPressed,
  });

  final double progress;
  final bool isLastPage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 76.w,
            height: 76.w,
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: 2.5,
              color: Appcolors.primaryColor1,
              backgroundColor: Appcolors.primaryColor1.withValues(alpha: 0.15),
            ),
          ),
          Material(
            color: Appcolors.primaryColor1,
            borderRadius: BorderRadius.circular(35.r),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(35.r),
              child: Container(
                width: 64.w,
                height: 64.w,
                alignment: Alignment.center,
                child: Icon(
                  isLastPage ? Icons.check : Icons.navigate_next,
                  color: Appcolors.white,
                  size: 28.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
