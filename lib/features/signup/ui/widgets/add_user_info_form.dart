import 'package:fitnestx/core/helpers/extentions.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserInfoForm extends StatefulWidget {
  const AddUserInfoForm({super.key});

  @override
  State<AddUserInfoForm> createState() => _AddUserInfoFormState();
}

class _AddUserInfoFormState extends State<AddUserInfoForm> {
  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final weightController = TextEditingController();

  final heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Appcolors.lightGray,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 15.w),
                  child: Image.asset(
                    'assets/icons/gender.png',
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.contain,
                    color: Appcolors.gray,
                  ),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Appcolors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      items: ["Male", "Female"]
                          .map(
                            (name) => DropdownMenuItem(
                              value: name,
                              child: Text(
                                name,
                                style: AppTextStyles.font14GrayRegular,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                      isExpanded: true,
                      hint: Text(
                        "Choose Gender",
                        style: AppTextStyles.font12GrayRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          FormContainer(
            controller: dateOfBirthController,
            prefixIcon: 'assets/icons/Calendar.png',
            hintText: 'Date of Birth',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid Date of Birth';
              }
            },
            keyboardType: TextInputType.datetime,
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: FormContainer(
                  controller: weightController,
                  prefixIcon: 'assets/icons/weight.png',
                  hintText: 'Your Weight',
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Please enter a valid Weight';
                    }
                  },
                ),
              ),
              horizontalSpace(10),
              Container(
                height: 45.w,
                width: 45.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: Appcolors.secondaryG,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text('KG', style: AppTextStyles.font15WhiteMedium),
              ),
            ],
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: FormContainer(
                  controller: heightController,
                  prefixIcon: 'assets/icons/Swap.png',
                  hintText: 'Your Height',
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Please enter a valid Height';
                    }
                  },
                ),
              ),
              horizontalSpace(10),
              Container(
                height: 45.w,
                width: 45.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: Appcolors.secondaryG,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('CM', style: AppTextStyles.font15WhiteMedium),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
