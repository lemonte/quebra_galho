import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Usuario {
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final String dataNascimento;
  final String senha;
  final String cep;
  final String cidade;
  final String estado;
  final String numero;
  final String rua;
  final String bairro;
  final List<String> profissoes;
  final String descricaoProfissional;
  const Usuario({
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.dataNascimento,
    required this.senha,
    required this.cep,
    required this.cidade,
    required this.estado,
    required this.numero,
    required this.rua,
    required this.bairro,
    this.profissoes = const [],
    this.descricaoProfissional = '',
  });

  void redefinirSenha(String novaSenha1, String novaSenha2) {
    if (novaSenha1 == novaSenha2) {
      copyWith(senha: novaSenha1);
    } else {
      throw Error.throwWithStackTrace(
          'Senhas não conferem', StackTrace.current);
    }
  }

  static Usuario get empty => const Usuario(
        bairro: '',
        cep: '',
        cidade: '',
        cpf: '',
        dataNascimento: '',
        email: '',
        estado: '',
        nome: '',
        numero: '',
        rua: '',
        senha: '',
        telefone: '',
      );

  String get endereco {
    return '$cidade, $estado, $bairro, $rua, $numero';
  }

  Usuario copyWith({
    String? nome,
    String? cpf,
    String? email,
    String? telefone,
    String? dataNascimento,
    String? senha,
    String? cep,
    String? cidade,
    String? estado,
    String? numero,
    String? rua,
    List<String>? profissoes,
    String? descricaoProfissional,
    String? bairro,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      profissoes: profissoes ?? this.profissoes,
      descricaoProfissional:
          descricaoProfissional ?? this.descricaoProfissional,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      senha: senha ?? this.senha,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      numero: numero ?? this.numero,
      rua: rua ?? this.rua,
      bairro: bairro ?? this.bairro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
      'Data Nascimento': dataNascimento,
      'cep': cep,
      'cidade': cidade,
      'estado': estado,
      'numero': numero,
      'bairro': bairro,
      'rua': rua,
      'Profissoes': profissoes.join(', '),
      'Descricao Profissional': descricaoProfissional,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      email: map['email'] as String,
      telefone: map['telefone'] as String,
      dataNascimento: map['dataNascimento'] as String,
      senha: map['senha'] as String,
      cep: map['cep'] as String,
      cidade: map['cidade'] as String,
      estado: map['estado'] as String,
      numero: map['numero'] as String,
      rua: map['rua'] as String,
      bairro: map['bairro'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usuario(nome: $nome, cpf: $cpf, email: $email, telefone: $telefone, dataNascimento: $dataNascimento, senha: $senha, cep: $cep, cidade: $cidade, estado: $estado, numero: $numero, rua: $rua, bairro: $bairro)';
  }

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.cpf == cpf &&
        other.email == email &&
        other.telefone == telefone &&
        other.dataNascimento == dataNascimento &&
        other.senha == senha &&
        other.cep == cep &&
        other.cidade == cidade &&
        other.estado == estado &&
        other.numero == numero &&
        other.rua == rua &&
        other.bairro == bairro;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        cpf.hashCode ^
        email.hashCode ^
        telefone.hashCode ^
        dataNascimento.hashCode ^
        senha.hashCode ^
        cep.hashCode ^
        cidade.hashCode ^
        estado.hashCode ^
        numero.hashCode ^
        rua.hashCode ^
        bairro.hashCode;
  }
}
