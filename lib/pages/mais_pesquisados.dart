import 'package:flutter/material.dart';
import 'package:quebra_galho/components/modelo_pagina.dart';
import 'package:quebra_galho/controllers/profissionais_controller.dart';
import 'package:quebra_galho/models/profissional.dart';
import 'package:quebra_galho/pages/profissional_page.dart';
import 'package:quebra_galho/shared/app_text_styles.dart';

class MaisPesquisadosPage extends StatefulWidget {
  const MaisPesquisadosPage({super.key});

  @override
  State<MaisPesquisadosPage> createState() => _MaisPesquisadosPageState();
}

class _MaisPesquisadosPageState extends State<MaisPesquisadosPage> {
  final profissionalController = ProfissionaisController.instance;
  bool isLoading = false;
  List<Profissional> list = [];
  @override
  void initState() {
    setState(() {
      list = profissionalController.profissionais;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModeloPagina(
      title: 'Mais Pesquisados',
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: listagemItensMaisProcurados(),
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
        : ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Busque por Profissional, Serviço ...',
                        style: AppTextStyles.bodyXxs.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ...itens
            ],
          );
  }

  Widget cardItemMaisPesquisado(Profissional produto, int index) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfissionalPage(
                    profissional: produto,
                  )),
        );
      },
      leading: Image.network(produto.imagem),
      title: Text(
        produto.titulo,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(produto.categoria),
      trailing: IntrinsicWidth(
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(produto.estrelas.toString())
          ],
        ),
      ),
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
