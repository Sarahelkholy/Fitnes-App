import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingContent extends StatelessWidget {
  final Map pageContent;
  const OnBoardingContent({super.key, required this.pageContent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(pageContent['image'].toString(), fit: BoxFit.fitWidth),
          verticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageContent['title'].toString(),
                  style: AppTextStyles.font24BlackBold,
                ),
                verticalSpace(10),

                Text(
                  pageContent['subtitle'].toString(),
                  style: AppTextStyles.font14GrayRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
