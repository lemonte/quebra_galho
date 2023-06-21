import 'dart:math';
import 'package:quebra_galho/controllers/profissionais_controller.dart';
import 'package:quebra_galho/controllers/usuario_controller.dart';
import 'package:quebra_galho/models/servico.dart';
import 'package:quebra_galho/shared/tools.dart';

class ServicosController {
  ServicosController._();

  static ServicosController? _instance;

  static ServicosController get instance {
    _instance ??= ServicosController._();
    return _instance!;
  }

  List<Servico> servicos = [];

  List<String> _status() {
    return [
      'Realizado',
      'Pendente',
      'Cancelado',
    ];
  }

  void request() {
    final profissionaisController = ProfissionaisController.instance;
    final usuarioController = UsuarioController.instance;
    final profissionais = profissionaisController.profissionais;
    servicos = List.generate(
      12,
      (index) {
        final profissional =
            profissionais[Random().nextInt(profissionais.length)];

        return Servico(
          comentario: '',
          dataExecucao: Tools.formatData(
              (DateTime.now().subtract(Duration(days: Random().nextInt(30))))
                  .toString()),
          endereco: usuarioController.usuario.endereco,
          estrelas: 0,
          imagem: profissional.imagem,
          nomePrestador: profissional.titulo,
          status: _status()[Random().nextInt(_status().length)],
          titulo: profissional.categoria,
        );
      },
    );
  }
}
