import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/login_request_body.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formekey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}

 
/**
 * errrrrrrrrrrrrr  response
 * {
    "data": [],
    "message": "Validation Error",
    "errors": {
        "email": [
            "The selected email is invalid."
        ]
    },
    "status": 422
}
 */


/**
 * success response
 * Logged in successfully!
 *  {
    "data": {
        "user": {
            "id": 11,
            "name": "mohammed",
            "email": "mo@mo.mo",
            "address": null,
            "city": null,
            "phone": null,
            "email_verified": false,
            "image": "https://codingarabic.online/admin/assets/img/default/user.jpg"
        },
        "token": "4173|Fo3wKK71sqpqD8QXGjX9VvioPTCeZJSHYRmj0EBK"
    },
    "message": "Logged in successfully!",
    "error": [],
    "status": 200
}*/