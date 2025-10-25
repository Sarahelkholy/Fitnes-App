import 'package:fitnestx/core/helpers/constants.dart';
import 'package:fitnestx/core/helpers/shared_pref_helper.dart';
import 'package:fitnestx/core/networking/api_result.dart';
import 'package:fitnestx/features/signup/data/models/sign_up_request_body.dart';
import 'package:fitnestx/features/signup/data/repo/sign_up_repo.dart';
import 'package:fitnestx/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final goalController = TextEditingController();
  final basicInfoFormKey = GlobalKey<FormState>();
  final userInfoFormKey = GlobalKey<FormState>();

  void emitAddBasicInfo(String name, String email, String password) {
    emit(const SignUpState.signupLoading());
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      nameController.text = name;
      emailController.text = email;
      passwordController.text = password;
      emit(const SignUpState.basicInfoAdded());
    } else {
      emit(
        const SignUpState.signupError(error: 'Please fill all required fields'),
      );
    }
  }

  void emitAddPhysicalInfo(
    String gender,
    String weight,
    String height,
    String dateOfBirth,
  ) {
    emit(const SignUpState.signupLoading());
    if (gender.isNotEmpty &&
        weight.isNotEmpty &&
        height.isNotEmpty &&
        dateOfBirth.isNotEmpty) {
      genderController.text = gender;
      weightController.text = weight;
      heightController.text = height;
      dateOfBirthController.text = dateOfBirth;
      emit(const SignUpState.physicalInfoAdded());
    } else {
      emit(
        const SignUpState.signupError(error: 'Please fill all required fields'),
      );
    }
  }

  void updateGoal(String goal) {
    goalController.text = goal;
  }

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signUpRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: genderController.text,
        goal: goalController.text,
        dateOfBirth: dateOfBirthController.text,
        weight: double.tryParse(weightController.text) ?? 0,
        height: double.tryParse(heightController.text) ?? 0,
      ),
    );
    response.when(
      success: (signUpResponse) async {
        await saveUserName(signUpResponse.userData?.name ?? '');

        emit(SignUpState.signupSuccess(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserName(String name) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userName, name);
  }
}
