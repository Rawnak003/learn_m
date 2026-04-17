enum PasswordValidationError {
  empty,
  tooShort,
  noUppercase,
  noLowercase,
  noDigit,
  noSpecialChar,
  notMatched,
}

class PasswordValidator {
  static const int minLength = 8;

  static PasswordValidationError? validate(String password) {
    if (password.trim().isEmpty) {
      return PasswordValidationError.empty;
    }

    if (password.length < minLength) {
      return PasswordValidationError.tooShort;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return PasswordValidationError.noUppercase;
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return PasswordValidationError.noLowercase;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return PasswordValidationError.noDigit;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return PasswordValidationError.noSpecialChar;
    }

    return null;
  }

  static PasswordValidationError? validatePassword({
    required String password,
    required String confirmPassword,
  }) {
    final passwordError = validate(password);
    if (passwordError != null) return passwordError;

    if (confirmPassword.trim().isEmpty) {
      return PasswordValidationError.notMatched;
    }

    if (password != confirmPassword) {
      return PasswordValidationError.notMatched;
    }

    return null;
  }

  static String getMessage(PasswordValidationError error) {
    switch (error) {
      case PasswordValidationError.empty:
        return 'Password is required';

      case PasswordValidationError.tooShort:
        return 'Password must be at least 8 characters';

      case PasswordValidationError.noUppercase:
        return 'Include at least one uppercase letter';

      case PasswordValidationError.noLowercase:
        return 'Include at least one lowercase letter';

      case PasswordValidationError.noDigit:
        return 'Include at least one number';

      case PasswordValidationError.noSpecialChar:
        return 'Include at least one special character';

      case PasswordValidationError.notMatched:
        return 'Passwords do not match';
    }
  }
}