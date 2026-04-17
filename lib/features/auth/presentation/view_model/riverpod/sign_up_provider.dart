import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../domain/password_validators.dart';
import '../states/sign_up_state.dart';


final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(),
);

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(SignUpState());

  void toggleCheckbox(bool value) {
    state = state.copyWith(isChecked: value);
  }

  void togglePassword() {
    state = state.copyWith(isPasswordObscure: !state.isPasswordObscure);
  }

  void toggleConfirmPassword() {
    state = state.copyWith(isConfirmPasswordObscure: !state.isConfirmPasswordObscure,);
  }

  void updateUserName(String value) {
    state = state.copyWith(username: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  String? validateSignUp() {
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    if (!state.isChecked) {
      return 'Please accept Terms & Conditions and Privacy Policies';
    }
    final error = PasswordValidator.validatePassword(
      password: password,
      confirmPassword: confirmPassword,
    );
    if (error != null) {
      return PasswordValidator.getMessage(error);
    }
    return null;
  }

  Future<String?> signUp() async {
    final error = validateSignUp();
    if (error != null) return error;

    try {
      debugPrint('\nStarting sign up process\n');
      state = state.copyWith(isLoading: true);

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: state.email.trim(),
        password: state.password.trim(),
      );

      debugPrint('\nUser created: ${credential.user}\n');

      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(state.username);

        AppUtils.showToast(
          'Verification email sent. Check your inbox.',
        );
        return null;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Error: ${e.code}');

      switch (e.code) {
        case 'email-already-in-use':
          return 'Email already in use';
        case 'invalid-email':
          return 'Invalid email';
        case 'weak-password':
          return 'Password is too weak';
        case 'network-request-failed':
          return 'No internet connection';
        default:
          return e.message ?? 'Authentication failed';
      }
    } catch (e) {
      debugPrint('Unknown Error: $e');
      return 'Something went wrong';
    } finally {
      state = state.copyWith(isLoading: false);
    }

    return null;
  }
}
