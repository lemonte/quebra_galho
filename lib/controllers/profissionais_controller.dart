import 'dart:math';

import 'package:dio/dio.dart';
import 'package:quebra_galho/models/api.dart';
import 'package:quebra_galho/models/profissional.dart';

class ProfissionaisController {
  ProfissionaisController._();

  static ProfissionaisController? _instance;

  static ProfissionaisController get instance {
    _instance ??= ProfissionaisController._();
    return _instance!;
  }

  List<Profissional> profissionais = [];

  final List<String> _categorias = const [
    'Mecânico(a)',
    'Encanador(a)',
    'Padeiro(a)',
    'Motorista',
    'Entregador(a)',
    'Manobrista',
    'Pedreiro(a)',
    'Eletricista',
    'Programadora(a)'
  ];

  Future<List<Profissional>> request() async {
    if (profissionais.isNotEmpty) return profissionais;
    try {
      final dio = Dio();
      final result = await dio.get(
        "https://randomuser.me/api/?nat=br&results=15",
      );
      final responseData = Api.fromJson(result.data);
      profissionais = responseData.results
              ?.map(
                (e) => Profissional(
                  categoria: _categorias[Random().nextInt(_categorias.length)],
                  estrelas: (Random().nextDouble() * 5).ceilToDouble(),
                  imagem: e.picture?.large ?? '',
                  titulo: e.name.toString(),
                ),
              )
              .toList() ??
          [];
      profissionais.sort((a, b) {
        if (a.estrelas > b.estrelas) return -1;
        if (a.estrelas < b.estrelas) return 1;
        return 0;
      });
      return profissionais;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
