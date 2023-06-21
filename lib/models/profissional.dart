class Profissional {
  final String titulo;
  final double estrelas;
  final String categoria;
  final String imagem;

  const Profissional({
    required this.titulo,
    required this.estrelas,
    required this.categoria,
    required this.imagem,
  });

  Profissional copyWith({
    String? titulo,
    double? estrelas,
    String? categoria,
    String? imagem,
  }) {
    return Profissional(
      titulo: titulo ?? this.titulo,
      estrelas: estrelas ?? this.estrelas,
      categoria: categoria ?? this.categoria,
      imagem: imagem ?? this.imagem,
    );
  }
}
