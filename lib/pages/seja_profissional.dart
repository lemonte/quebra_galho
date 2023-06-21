import 'package:flutter/material.dart';
import 'package:quebra_galho/components/modelo_pagina.dart';
import 'package:quebra_galho/controllers/usuario_controller.dart';
import 'package:quebra_galho/shared/app_colors.dart';

class SejaProfissional extends StatefulWidget {
  const SejaProfissional({super.key});

  @override
  State<SejaProfissional> createState() => _SejaProfissionalState();
}

class _SejaProfissionalState extends State<SejaProfissional> {
  final profissoes = [
    'Encanador(a)',
    'Mecânico(a)',
    'Advogado(a)',
    'Eletricista',
    'Motorista',
    'Garçom'
  ];

  List<int> profissaoSelecionada = [];
  String descricao = '';

  @override
  Widget build(BuildContext context) {
    return ModeloPagina(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColorApp,
        onPressed: () {
          final store = UsuarioController.instance;
          final prof = profissaoSelecionada.map((e) => profissoes[e]).toList();
          store.usuario = store.usuario.copyWith(
            descricaoProfissional: descricao,
            profissoes: prof,
          );
          Navigator.pop(context);
        },
        label: const Row(
          children: [
            Icon(Icons.save),
            SizedBox(
              width: 4,
            ),
            Text('Finalizar'),
          ],
        ),
      ),
      title: 'Seja um Profissional',
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Selecione as profissões que atua',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 24,
            ),
            ...listaProfissoes(),
            Container(
              margin: const EdgeInsets.all(24),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Descrição do histórico Profissional: "),
                maxLines: null,
                onChanged: (text) {
                  setState(() {
                    descricao = text;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> listaProfissoes() {
    final List<Widget> list = [];
    for (var i = 0; i < profissoes.length; i++) {
      final contem = profissaoSelecionada.contains(i);
      list.add(ListTile(
        onTap: () {
          if (contem) {
            profissaoSelecionada.remove(i);
            profissaoSelecionada = List.from(profissaoSelecionada);
          } else {
            profissaoSelecionada = List.from([...profissaoSelecionada, i]);
          }
          setState(() {});
        },
        leading: Icon(
          contem ? Icons.circle : Icons.circle_outlined,
          color: Colors.grey,
        ),
        title: Text(profissoes[i]),
      ));
    }
    return list;
  }
}
