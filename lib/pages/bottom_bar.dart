import 'package:flutter/material.dart';
import 'package:quebra_galho/controllers/profissionais_controller.dart';
import 'package:quebra_galho/controllers/servicos_controller.dart';
import 'package:quebra_galho/pages/historico.dart';
import 'package:quebra_galho/pages/home.dart';
import 'package:quebra_galho/pages/notificacoes_page.dart';
import 'package:quebra_galho/pages/perfil_page.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Historico(),
    const NotificacoesPage(),
    const UserPage(),
  ];
  final profissionalController = ProfissionaisController.instance;
  bool isLoading = true;
  @override
  void initState() {
    profissionalController.request().then((value) {
      ServicosController.instance.request();
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorApp,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryColorApp,
        onTap: _onItemTapped,
      ),
    );
  }
}
