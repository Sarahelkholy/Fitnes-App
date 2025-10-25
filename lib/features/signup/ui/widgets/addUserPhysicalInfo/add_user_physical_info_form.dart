import 'package:fitnestx/core/helpers/app_regex.dart';
import 'package:fitnestx/core/helpers/spacing.dart';
import 'package:fitnestx/core/theming/app_colors.dart';
import 'package:fitnestx/core/theming/app_text_styles.dart';
import 'package:fitnestx/core/widgets/form_container.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserPhysicalInfoForm extends StatefulWidget {
  const AddUserPhysicalInfoForm({super.key});

  @override
  State<AddUserPhysicalInfoForm> createState() =>
      _AddUserPhysicalInfoFormState();
}

class _AddUserPhysicalInfoFormState extends State<AddUserPhysicalInfoForm> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().userInfoFormKey,
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
                      value: selectedGender,
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
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                        context.read<SignUpCubit>().genderController.text =
                            value!;
                      },
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
            controller: context.read<SignUpCubit>().dateOfBirthController,
            prefixIcon: 'assets/icons/Calendar.png',
            hintText: 'Date of Birth',
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                context.read<SignUpCubit>().dateOfBirthController.text =
                    "${date.day}/${date.month}/${date.year}";
              }
            },
            isReadOnly: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
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
                  controller: context.read<SignUpCubit>().weightController,
                  keyboardType: TextInputType.number,
                  prefixIcon: 'assets/icons/weight.png',
                  hintText: 'Your Weight',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isWeightValid(value)) {
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
                  controller: context.read<SignUpCubit>().heightController,
                  prefixIcon: 'assets/icons/Swap.png',
                  keyboardType: TextInputType.number,

                  hintText: 'Your Height',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isHeightValid(value)) {
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
