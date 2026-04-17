class SignUpState {
  final bool isChecked;
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;
  final bool isLoading;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({
    this.isChecked = false,
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
    this.isLoading = false,
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    bool? isChecked,
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
    bool? isLoading,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      isChecked: isChecked ?? this.isChecked,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure: isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
