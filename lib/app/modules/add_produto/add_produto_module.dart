import 'package:hasura_connect/hasura_connect.dart';
import 'package:lojahasura/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:lojahasura/app/modules/add_produto/add_produto_Page.dart';
import 'package:lojahasura/app/modules/add_produto/add_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind.lazySingleton(
        (i) => AddProdutoController(i.get<AddProdutoRepository>())),

    ///Repositories
    //Bind.lazySingleton((i) => AddProdutoRepository(i.get<HasuraConnect>())),
    Bind.lazySingleton(
        (i) => AddProdutoRepository(Modular.get<HasuraConnect>())),
    //Outros
    //Bind.lazySingleton((i) => HasuraConnect("https://graphql-hasura-flutter.herokuapp.com/v1/graphql")),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AddProdutoPage()),
  ];
}
