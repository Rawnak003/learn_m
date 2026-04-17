class SignInState {
  final bool isPasswordObscure;
  final String email;
  final String password;

  const SignInState({
    this.isPasswordObscure = true,
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({
    bool? isPasswordObscure,
    String? email,
    String? password,
  }) {
    return SignInState(
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
