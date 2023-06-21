import 'package:flutter/material.dart';
import 'package:quebra_galho/models/servico.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:quebra_galho/shared/tools.dart';
import 'package:url_launcher/url_launcher.dart';

Servico? serv;

class DetalhesHistoricoPage extends StatefulWidget {
  final Servico servico;
  const DetalhesHistoricoPage({
    Key? key,
    required this.servico,
  }) : super(key: key);

  @override
  State<DetalhesHistoricoPage> createState() => _DetalhesHistoricoPageState();
}

class _DetalhesHistoricoPageState extends State<DetalhesHistoricoPage> {
  int counter = 0;
  int star = 0;
  late Servico servico;
  @override
  void initState() {
    serv = widget.servico;
    servico = widget.servico;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: servico.estrelas == 0.0
          ? FloatingActionButton.extended(
              onPressed: () {
                serv = servico;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Avalie o serviço",
                      ),
                      content: const Avalie(),
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
                            setState(() {
                              servico =
                                  servico.copyWith(estrelas: serv?.estrelas);
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  },
                );
              },
              backgroundColor: AppColors.primaryColorApp,
              label: const Row(children: [
                Icon(Icons.star),
                SizedBox(
                  width: 8,
                ),
                Text('Avalie o serviço'),
              ]),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Chamar novamente o Profissional"),
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
                Text('Chamar novamente'),
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
                                    servico.nomePrestador
                                        .replaceAll('Mrs', '')
                                        .trim(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(servico.titulo)
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
                                        color: servico.estrelas == 0
                                            ? Colors.grey
                                            : Colors.yellow,
                                      ),
                                      Text(
                                        (servico.estrelas == 0)
                                            ? 'Ainda não avaliado'
                                            : servico.estrelas.toString(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: AppColors.iconsColorApp,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Iniciado em: ${servico.dataExecucao}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: AppColors.iconsColorApp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.date_range,
                                        color: AppColors.iconsColorApp,
                                      ),
                                      Text(
                                        "Finalizado: ${servico.dataExecucao}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: AppColors.iconsColorApp),
                                        textAlign: TextAlign.center,
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
                                servico.imagem,
                              ),
                              fit: BoxFit.cover),
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
                          title: Text(
                            Tools.toUpperCaseFirstLetter("Status"),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Alterar status"),
                                    content: const AlterarStatus(),
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
                                          setState(() {
                                            servico = servico.copyWith(
                                                status: serv?.status);
                                          });
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          subtitle: Text(
                            servico.status,
                            style: TextStyle(
                              color: servico.status == "Pendente"
                                  ? Colors.orange
                                  : servico.status == "Cancelado"
                                      ? Colors.red
                                      : servico.status == "Realizado"
                                          ? Colors.green
                                          : Colors.orange,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            Tools.toUpperCaseFirstLetter("Endereço"),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColors.textColor,
                            ),
                          ),
                          subtitle: Text(
                            servico.endereco,
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

class AlterarStatus extends StatefulWidget {
  const AlterarStatus({super.key});

  @override
  State<AlterarStatus> createState() => _AlterarStatusState();
}

class _AlterarStatusState extends State<AlterarStatus> {
  final list = ['Cancelado', 'Realizado', 'Pendente'];
  String selecionado = serv?.status ?? '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        list.length,
        (index) => ListTile(
          onTap: () {
            setState(() {
              selecionado = list[index];
            });
            serv = serv?.copyWith(status: selecionado);
          },
          leading: Icon(
            selecionado == list[index] ? Icons.circle : Icons.circle_outlined,
            color: AppColors.iconsColorApp,
          ),
          title: Text(list[index]),
        ),
      ),
    );
  }
}

class Avalie extends StatefulWidget {
  const Avalie({super.key});

  @override
  State<Avalie> createState() => _AvalieState();
}

class _AvalieState extends State<Avalie> {
  int star = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => IconButton(
          onPressed: () {
            setState(() {
              star = index + 1;
            });
            serv = serv?.copyWith(estrelas: star.toDouble());
          },
          icon: Icon(
            Icons.star,
            color: (index) < star ? Colors.orange : Colors.grey,
          ),
        ),
      ),
    );
  }
}
