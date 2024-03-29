// To parse this JSON data, do
//
//     final tipoCategoriaProdutoDto = tipoCategoriaProdutoDtoFromJson(jsonString);

import 'dart:convert';

class TipoCategoriaProdutoDto {
  final List<TipoECategoriaDto> tipoProduto;
  final List<TipoECategoriaDto> categoriaProduto;

  TipoCategoriaProdutoDto({
    required this.tipoProduto,
    required this.categoriaProduto,
  });

  TipoCategoriaProdutoDto copyWith({
    required List<TipoECategoriaDto> tipoProduto,
    required List<TipoECategoriaDto> categoriaProduto,
  }) =>
      TipoCategoriaProdutoDto(
        tipoProduto: tipoProduto,
        categoriaProduto: categoriaProduto,
      );

  factory TipoCategoriaProdutoDto.fromJson(String str) =>
      TipoCategoriaProdutoDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) =>
      TipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDto>.from(
            json["tipo_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        categoriaProduto: List<TipoECategoriaDto>.from(
            json["categoria_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto":
            List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
      };

  static List<TipoCategoriaProdutoDto> fromJsonList(List list) {
    //if (list == null) return null;
    return list
        .map<TipoCategoriaProdutoDto>(
            (item) => TipoCategoriaProdutoDto.fromMap(item))
        .toList();
  }
}

class TipoECategoriaDto {
  final String id;
  final String descricao;

  TipoECategoriaDto({
    required this.id,
    required this.descricao,
  });

  TipoECategoriaDto copyWith({
    required String id,
    required String descricao,
  }) =>
      TipoECategoriaDto(
        id: id,
        descricao: descricao,
      );

  factory TipoECategoriaDto.fromJson(String str) =>
      TipoECategoriaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoECategoriaDto.fromMap(Map<String, dynamic> json) =>
      TipoECategoriaDto(
        id: json["id"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descricao": descricao,
      };
}
