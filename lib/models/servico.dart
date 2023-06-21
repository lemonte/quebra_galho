// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Servico {
  final String nomePrestador;
  final String status;
  final String titulo;
  final String dataExecucao;
  final String imagem;
  final double estrelas;
  final String comentario;
  final String endereco;
  Servico({
    required this.nomePrestador,
    required this.status,
    required this.titulo,
    required this.dataExecucao,
    required this.imagem,
    required this.estrelas,
    required this.comentario,
    required this.endereco,
  });

  Servico copyWith({
    String? nomePrestador,
    String? status,
    String? dataExecucao,
    String? icone,
    String? titulo,
    double? estrelas,
    String? comentario,
    String? endereco,
  }) {
    return Servico(
      nomePrestador: nomePrestador ?? this.nomePrestador,
      status: status ?? this.status,
      titulo: titulo ?? this.titulo,
      dataExecucao: dataExecucao ?? this.dataExecucao,
      imagem: icone ?? this.imagem,
      estrelas: estrelas ?? this.estrelas,
      comentario: comentario ?? this.comentario,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomePrestador': nomePrestador,
      'status': status,
      'titulo': titulo,
      'dataExecucao': dataExecucao,
      'imagem': imagem,
      'estrelas': estrelas,
      'comentario': comentario,
      'endereco': endereco,
    };
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      nomePrestador: map['nomePrestador'] as String,
      status: map['status'] as String,
      titulo: map['titulo'] as String,
      dataExecucao: map['dataExecucao'] as String,
      imagem: map['imagem'] as String,
      estrelas: map['estrelas'] as double,
      comentario: map['comentario'] as String,
      endereco: map['endereco'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Servico.fromJson(String source) =>
      Servico.fromMap(json.decode(source) as Map<String, dynamic>);
}
