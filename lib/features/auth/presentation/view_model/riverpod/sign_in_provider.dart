import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/sign_in_state.dart';

final signInProvider = StateNotifierProvider<SignInProvider, SignInState>((ref) => SignInProvider(),);


class SignInProvider extends StateNotifier<SignInState> {
  SignInProvider() : super(const SignInState());

  void togglePassword() {
    state = state.copyWith(isPasswordObscure: !state.isPasswordObscure);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
}