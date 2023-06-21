import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:quebra_galho/models/usuario.dart';
import 'package:quebra_galho/pages/bottom_bar.dart';
import 'package:quebra_galho/pages/register_page.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool isRegister = false;

  final users = {
    'dribbble@gmail.com': '12345',
    'geanderson@gmail.com': 'teste',
    'teste': 'teste',
  };

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usuario não cadastrado';
      }
      if (users[data.name] != data.password) {
        return 'Senha incorreta';
      }
      isRegister = false;
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      isRegister = true;
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Usuário não existe';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: '',
      theme: LoginTheme(
        primaryColor: AppColors.primaryColorApp,
        accentColor: AppColors.primaryColorApp,
        switchAuthTextColor: AppColors.iconsColorApp,
        logoWidth: 1000,
        primaryColorAsInputLabel: true,
        footerBackgroundColor: AppColors.primaryColorApp,
        // cardTheme: CardTheme(
        //   color: Colors.white,
        //   shadowColor: AppColors.primaryColorApp,
        //   surfaceTintColor: AppColors.primaryColorApp,
        // ),
        buttonTheme: const LoginButtonTheme(
          highlightColor: AppColors.primaryColorApp,
          backgroundColor: AppColors.primaryColorApp,
          splashColor: AppColors.primaryColorApp,
        ),
        inputTheme: const InputDecorationTheme(
          iconColor: AppColors.iconsColorApp,
          prefixIconColor: AppColors.iconsColorApp,
          suffixIconColor: AppColors.iconsColorApp,
          hoverColor: AppColors.iconsColorApp,
          fillColor: AppColors.iconsColorApp,
          focusColor: AppColors.iconsColorApp,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      messages: LoginMessages(
        signUpSuccess: 'Cadastro realizado com sucesso!',
        confirmSignupButton: 'Confirmar Cadastro',
        forgotPasswordButton: 'Esqueceu a senha ?',
        passwordHint: 'Senha',
        confirmPasswordError: 'Insira a senha correta',
        loginButton: 'Entrar',
        signupButton: 'Cadastre-se',
        confirmPasswordHint: 'Confirme sua senha',
        recoverPasswordDescription: 'Insira seu email para enviarmos o código',
        recoveryCodeHint: 'Insira seu email',
        recoverCodePasswordDescription: 'aa',
        recoverPasswordButton: 'Recuperar senha',
        goBackButton: 'Voltar',
        recoverPasswordIntro: 'Recuperar senha',
        confirmRecoverSuccess: 'Recuperação de senha',
        confirmRecoverIntro: 'aa',
      ),
      userValidator: (value) {
        if (value == null) {
          return 'Insira um valor valido de email';
        }
        if (value.isEmpty) {
          return 'Insira um valor valido de email';
        }
        return null;
      },
      savedEmail: 'teste',
      savedPassword: 'teste',
      navigateBackAfterRecovery: true,
      passwordValidator: (value) {
        if (value == null) {
          return 'Insira um valor valido de senha';
        }
        if (value.isEmpty) {
          return 'Insira um valor valido de senha';
        }
        return null;
      },
      logo: const AssetImage('assets/login.png'),
      logoTag: 'Logo Quebra Galho',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        if (isRegister) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => RegisterPage(
              usuario: Usuario.empty,
            ),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const BottomBarWidget(),
          ));
        }
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
