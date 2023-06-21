import 'package:quebra_galho/models/usuario.dart';

class UsuarioController {
  UsuarioController._();

  static UsuarioController? _instance;

  static UsuarioController get instance {
    _instance ??= UsuarioController._();
    return _instance!;
  }

  Usuario usuario = const Usuario(
    nome: 'Geanderson',
    cpf: '12312312312',
    email: 'teste@teste.teste',
    telefone: '(27)988109108',
    dataNascimento: '19/06/2000',
    cep: '29705-208',
    cidade: 'Colatina',
    estado: 'ES',
    senha: 'TESTE123',
    numero: '123',
    rua: 'Bc José Domingos Mondoni',
    bairro: 'Carlos Germano Naumann',
  );
}
