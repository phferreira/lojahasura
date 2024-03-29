import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:lojahasura/app/modules/update_produto/models/produto_tipo_categoria_produto_dto.dart';

class UpdateProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  UpdateProdutoRepository(this._hasuraConnect);

  Future<ProdutoTipoCategoriaProdutoDto> getProdutoTipoCategoriaProduto(
      String idProduto) async {
    var query = ''' 
           query getProdutoTipoCategoriaProduto(\$idProduto: uuid!) {
              tipo_produto {
                id
                descricao
              }
              categoria_produto {
                id
                descricao
              }
              produtos_by_pk(id: \$idProduto) {
                id
                nome
                valor
                tipo_produto_id
                categoria_produto {
                  id
                  descricao
                }
                tipo_produto {
                  id
                  descricao
                }
              }              
            }
      ''';

    var snapshot =
        await _hasuraConnect.query(query, variables: {"idProduto": idProduto});

    return ProdutoTipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }

  Future<bool> updateProduto(
      {required String idProduto,
      required String descricao,
      required String valor,
      required String selectedTipo,
      required String selectedCategoria}) async {
    try {
      var mutation = ''' 
           mutation update_produto(\$idProduto: uuid, \$nome: String, \$categoria: uuid, \$tipo: uuid, \$valor: float8) {
              update_produtos(where: {id: {_eq: \$idProduto}},
                _set: {
                  nome: \$nome,
                  tipo_produto_id: \$tipo,
                  valor: \$valor, 
                  categoria_produto_id: \$categoria})
              {
                affected_rows
              }
            }
      ''';

      var snapshot = await _hasuraConnect.mutation(mutation, variables: {
        "nome": descricao,
        "categoria": selectedCategoria,
        "tipo": selectedTipo,
        "valor": double.parse(valor),
        "idProduto": idProduto,
      });

      return snapshot["data"]["update_produtos"]["affected_rows"] > 0;
    } catch (e) {
      return false;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
