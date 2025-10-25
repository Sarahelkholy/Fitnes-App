import 'package:fitnestx/core/helpers/constants.dart';
import 'package:fitnestx/core/helpers/shared_pref_helper.dart';
import 'package:fitnestx/core/networking/api_result.dart';
import 'package:fitnestx/features/login/data/models/login_request_body.dart';
import 'package:fitnestx/features/login/data/repo/login_repo.dart';
import 'package:fitnestx/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token ?? '');
        await saveUserName(loginResponse.userData?.name ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    // DioFactory.setTokenInHeaderAfterLogin(token);
  }

  Future<void> saveUserName(String name) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userName, name);
  }
}
