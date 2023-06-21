import 'package:flutter/material.dart';
import 'package:quebra_galho/login_page.dart';
import 'package:quebra_galho/models/api.dart';
import 'package:quebra_galho/pages/bottom_bar.dart';
import 'package:quebra_galho/shared/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quebra',
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            iconColor: AppColors.iconsColorApp,
            fillColor: AppColors.iconsColorApp,
            hoverColor: AppColors.iconsColorApp,
            prefixIconColor: AppColors.iconsColorApp,
            suffixIconColor: AppColors.iconsColorApp,
            activeIndicatorBorder: BorderSide(
              color: AppColors.iconsColorApp,
            ),
            labelStyle: TextStyle(
              color: AppColors.iconsColorApp,
            ),
          ),
          iconTheme: const IconThemeData(
            color: AppColors.iconsColorApp,
          )),
      home: LoginScreen(),
    );
  }
}
