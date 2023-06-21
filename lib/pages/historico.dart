import 'package:flutter/material.dart';
import 'package:quebra_galho/controllers/servicos_controller.dart';
import 'package:quebra_galho/models/servico.dart';
import 'package:quebra_galho/pages/detalhes_historico_page.dart';
import 'package:quebra_galho/shared/app_colors.dart';
import 'package:quebra_galho/shared/app_font_weight.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  bool isLoading = false;
  List<Servico> list = ServicosController.instance.servicos;
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
                                Icon(Icons.history),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "Histórico",
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
                          title: Text("Seus historicos de chamados"),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        listagemItensMaisProcurados(),
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

  Widget listagemItensMaisProcurados() {
    final List<Widget> itens = List.generate(
        list.length, (index) => cardItemMaisPesquisado(list[index], index));

    return (isLoading)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: itens,
          );
  }

  Widget cardItemMaisPesquisado(Servico servico, int index) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetalhesHistoricoPage(
                        servico: servico,
                      )),
            );
          },
          leading: Image.network(servico.imagem),
          title: Text(servico.titulo),
          subtitle: Text(
            servico.status,
            style: TextStyle(
                color: (servico.status == 'Pendente')
                    ? Colors.orange
                    : (servico.status == 'Cancelado')
                        ? Colors.red
                        : Colors.green),
          ),
          trailing: Text(servico.dataExecucao),
        ),
        const Divider()
      ],
    );
  }

  Widget itemHorizontalList({
    required String path,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
              path,
            )),
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange,
            border: Border.all(
              color: Colors.black38,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
