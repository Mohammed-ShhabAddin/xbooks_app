import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/signup_request_body.dart';
import '../data/repo/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
