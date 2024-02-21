import 'dart:io';

import '../enums/auth_mode_enum.dart';

class AuthFormModel {
  String name = '';
  String registrationNumber = '';
  DateTime? birthDate;
  String email = '';
  String password = '';
  File? image;
  DateTime registrationDate = DateTime.now();
  bool isLoading = false;

  // Iniciar na tela de login
  AuthModeEnum _mode = AuthModeEnum.login;

  // Getters que irão retornar se está em login ou signup
  bool get isLogin {
    return _mode == AuthModeEnum.login;
  }

  bool get isSignup {
    return _mode == AuthModeEnum.signup;
  }

  void toggleAuthMode() {
    // Se tiver login, muda pra signup, senão muda pra login
    _mode = isLogin ? AuthModeEnum.signup : AuthModeEnum.login;
  }
}
