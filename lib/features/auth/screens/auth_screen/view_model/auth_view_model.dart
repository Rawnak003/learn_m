import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ================= SIGN IN =================

class SignInState {
  final bool isPasswordObscure;

  const SignInState({this.isPasswordObscure = true});

  SignInState copyWith({bool? isPasswordObscure}) {
    return SignInState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
    );
  }
}

class SignInController extends StateNotifier<SignInState> {
  SignInController() : super(const SignInState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePassword() {
    state = state.copyWith(isPasswordObscure: !state.isPasswordObscure);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final signInProvider = StateNotifierProvider<SignInController, SignInState>(
  (ref) => SignInController(),
);

/// ================= SIGN UP =================

class SignUpState {
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;
  final bool isChecked;

  const SignUpState({
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
    this.isChecked = false,
  });

  SignUpState copyWith({
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
    bool? isChecked,
  }) {
    return SignUpState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure:
          isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController() : super(const SignUpState());

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void togglePassword() {
    state = state.copyWith(isPasswordObscure: !state.isPasswordObscure);
  }

  void toggleConfirmPassword() {
    state = state.copyWith(
      isConfirmPasswordObscure: !state.isConfirmPasswordObscure,
    );
  }

  void toggleCheckbox(bool value) {
    state = state.copyWith(isChecked: value);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

final signUpProvider = StateNotifierProvider<SignUpController, SignUpState>(
  (ref) => SignUpController(),
);
