import 'package:flutter/material.dart';
import 'package:quebra_galho/controllers/usuario_controller.dart';
import 'package:quebra_galho/models/usuario.dart';
import 'package:quebra_galho/pages/register_page.dart';
import 'package:quebra_galho/pages/seja_profissional.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:quebra_galho/shared/tools.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int counter = 0;
  Usuario usuario = UsuarioController.instance.usuario;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: usuario.profissoes.isEmpty
          ? FloatingActionButton.extended(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SejaProfissional(),
                  ),
                );
                setState(() {
                  usuario = UsuarioController.instance.usuario;
                });
              },
              backgroundColor: AppColors.primaryColorApp,
              label: const Row(
                children: [
                  Icon(Icons.work),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Seja um profissional')
                ],
              ),
            )
          : null,
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
              margin: const EdgeInsets.fromLTRB(15, 200, 15, 15),
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
                            Container(
                              margin: const EdgeInsets.only(left: 95),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    usuario.nome,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(usuario.profissoes.isEmpty
                                      ? "Conta de usuário"
                                      : "Conta de profissional"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.location_city,
                                        color: AppColors.iconsColorApp,
                                      ),
                                      Text(
                                        usuario.cidade,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: AppColors.iconsColorApp),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.power_settings_new_outlined,
                                            color: AppColors.iconsColorApp,
                                          ),
                                          onTap: () {},
                                        ),
                                        Text(
                                          'Sair',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.iconsColorApp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.help,
                                            color: AppColors.iconsColorApp,
                                          ),
                                          onTap: () {},
                                        ),
                                        Text(
                                          'Ajuda',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.iconsColorApp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                              ),
                              fit: BoxFit.cover),
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
                        ListTile(
                          title: const Text("Suas Informações"),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage(
                                          usuario: usuario,
                                        )));
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                        ...usuario.toMap().entries.map(
                          (e) {
                            return Visibility(
                              visible: e.value.toString().isNotEmpty,
                              child: ListTile(
                                title:
                                    Text(Tools.toUpperCaseFirstLetter(e.key)),
                                subtitle: Text(e.value),
                              ),
                            );
                          },
                        ).toList(),
                        const Divider(),
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
