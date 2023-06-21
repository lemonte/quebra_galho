import 'package:flutter/material.dart';
import 'package:quebra_galho/components/modelo_pagina.dart';
import 'package:quebra_galho/controllers/profissionais_controller.dart';
import 'package:quebra_galho/models/profissional.dart';
import 'package:quebra_galho/pages/mais_pesquisados.dart';
import 'package:quebra_galho/pages/profissional_page.dart';
import 'package:quebra_galho/shared/app_font_weight.dart';
import 'package:quebra_galho/shared/app_text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final profissionalController = ProfissionaisController.instance;
  bool isLoading = false;
  List<Profissional> list = [];
  @override
  void initState() {
    list = profissionalController.profissionais;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModeloPagina(
      title: 'Quebra Galho',
      isHome: true,
      body: isLoading
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  title: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // analyticsController.evento(
                          //   nomeEvento: TagEventsAnalytics.tagCampoPesquisarHome,
                          // );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const PesquisaPage()),
                          // );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(8),
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
                      ),
                    ],
                  ),
                  floating: true,
                  toolbarHeight: 60,
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Colatina, ES',
                        style: AppTextStyles.bodyXxs.copyWith(
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                                onTap: () {
                                  // analyticsController.evento(
                                  //     nomeEvento: TagEventsAnalytics.tabBannerClicado,
                                  //     parametro: {
                                  //       'nome': 'assets/monte_sua_lista.png',
                                  //     });
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const ListaComprasPage()),
                                  // );
                                },
                                child: itemHorizontalList(
                                    path: 'assets/monte_sua_lista.png')),
                            InkWell(
                              onTap: () {
                                // analyticsController.evento(
                                //     nomeEvento: TagEventsAnalytics.tabBannerClicado,
                                //     parametro: {
                                //       'nome': 'assets/pesquisa_produto.png',
                                //     });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => PesquisaPage()),
                                // );
                              },
                              child: itemHorizontalList(
                                  path: 'assets/pesquisa_produto.png'),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Material(
                        color: Colors.white,
                        elevation: 4,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Top 5 serviços pesquisados',
                                    style: AppTextStyles.bodyXxs.copyWith(
                                      fontWeight: AppFontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MaisPesquisadosPage()),
                                      );
                                    },
                                    child: Text(
                                      'Ver mais',
                                      style: AppTextStyles.bodyXxs.copyWith(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              listagemItensMaisProcurados()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
    );
  }

  Widget listagemItensMaisProcurados() {
    return Column(
        children: List.generate(
            5, (index) => cardItemMaisPesquisado(list[index], index)));
  }

  Widget cardItemMaisPesquisado(Profissional produto, int index) {
    return Column(
      children: [
        ListTile(
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
          title: Text(produto.titulo),
          subtitle: Text(produto.categoria),
          trailing: IntrinsicWidth(
            child: Row(
              children: [
                Stack(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 3,
                        top: 3,
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 24,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Text(produto.estrelas.toString())
              ],
            ),
          ),
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
            // image: DecorationImage(
            //     image: AssetImage(
            //   path,
            // )),
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
