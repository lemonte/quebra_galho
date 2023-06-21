import 'package:flutter/material.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:quebra_galho/shared/app_font_weight.dart';

class NotificacoesPage extends StatefulWidget {
  const NotificacoesPage({Key? key}) : super(key: key);

  @override
  State<NotificacoesPage> createState() => _NotificacoesPageState();
}

class _NotificacoesPageState extends State<NotificacoesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: AppColors.primaryColorApp,
              height: 250,
              width: double.infinity,
              child: const Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 200, 16, 16),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.notifications),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "Notificações",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: AppFontWeight.bold,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                          title: Text("Suas Notificações"),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () => {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Solicite um serviço"),
                                    content: const Text(
                                        "Encontre aqui o profissional ideal para seu serviço"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Voltar"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                })
                          },
                          child: const ListTile(
                            title: Text('Solicite um serviço'),
                            subtitle: Text(
                                'Encontre aqui o profissional ideal para seu serviço'),
                            leading: Icon(
                              Icons.verified,
                              color: AppColors.primaryColorApp,
                              size: 38,
                            ),
                          ),
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () => {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Bem Vindo ao aplicativo Quebra Galho",
                                  ),
                                  content: const Text(
                                      "Encontre aqui o profissional ideal para seu serviço"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Voltar"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            )
                          },
                          child: const ListTile(
                            title: Text('Bem Vindo ao aplicativo Quebra Galho'),
                            subtitle: Text(
                                'Encontre aqui o profissional ideal para seu serviço'),
                            leading: Icon(
                              Icons.verified,
                              color: AppColors.primaryColorApp,
                              size: 38,
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
