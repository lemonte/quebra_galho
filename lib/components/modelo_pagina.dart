import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class ModeloPagina extends StatelessWidget {
  final String title;
  final Widget body;
  final bool isHome;
  final FloatingActionButton? floatingActionButton;
  const ModeloPagina({
    super.key,
    required this.title,
    required this.body,
    this.isHome = false,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.dark,
          ),
          surfaceTintColor: AppColors.primaryColorApp,
          centerTitle: true,
          // elevation: 10,
          leading: Navigator.canPop(context) && !isHome
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                )
              : null,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColorApp,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: body,
        ));
  }
}
