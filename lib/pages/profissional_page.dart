import 'package:flutter/material.dart';
import 'package:quebra_galho/models/profissional.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfissionalPage extends StatefulWidget {
  final Profissional profissional;
  const ProfissionalPage({
    Key? key,
    required this.profissional,
  }) : super(key: key);

  @override
  State<ProfissionalPage> createState() => _ProfissionalPageState();
}

class _ProfissionalPageState extends State<ProfissionalPage> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Chamar Profissional"),
                content: const Text(
                    "Deseja realmente entrar em contato com esse profissional"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Voltar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text("Confirmar"),
                    onPressed: () {
                      Navigator.pop(context);
                      openPhone("+5527998267389");
                    },
                  )
                ],
              );
            },
          );
        },
        backgroundColor: AppColors.primaryColorApp,
        label: const Row(children: [
          Icon(Icons.call),
          SizedBox(
            width: 8,
          ),
          Text('Chamar profissional'),
        ]),
      ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.profissional.titulo
                                        .replaceAll('Mrs', '')
                                        .trim(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(widget.profissional.categoria)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: widget.profissional.estrelas == 0
                                            ? Colors.grey
                                            : Colors.yellow,
                                      ),
                                      Text(
                                        widget.profissional.estrelas.toString(),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.school,
                                        color: AppColors.iconsColorApp,
                                      ),
                                      Text(
                                        "Possui técnico em ${widget.profissional.categoria}",
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
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.profissional.imagem,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 0),
                          child: const Text(
                            "Informações do serviço: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 16, top: 0),
                          leading: const Icon(Icons.info),
                          title: const Text(
                            'Sobre o Profissional',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            'Trabalho com ${widget.profissional.categoria} a cerca de 10 anos',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 60,
                left: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> openPhone(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    try {
      final can = await launchUrl(launchUri);
      print(can);
    } catch (e) {
      print(e);
    }
  }
}
