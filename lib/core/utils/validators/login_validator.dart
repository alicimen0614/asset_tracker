final class LoginValidator {
  String? validateEmail(String? value) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return 'E-posta boş olamaz';
    } else if (!regExp.hasMatch(value)) {
      return 'Geçersiz e-posta adresi';
    }
    return null;
  }

  String? validatePassword(String? value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
    RegExp regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Şifre boş olamaz';
    } else if (!regExp.hasMatch(value)) {
      return 'Şifre en az 6 karakter olmalı ve en az bir harf ve bir rakam içermeli';
    }
    return null;
  }
}
