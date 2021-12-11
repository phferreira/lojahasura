import 'package:hasura_connect/hasura_connect.dart';
import 'package:lojahasura/app/modules/update_produto/repositories/update_produto_repository.dart';
import 'package:lojahasura/app/modules/update_produto/update_produto_Page.dart';
import 'package:lojahasura/app/modules/update_produto/update_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind.lazySingleton((i) => UpdateProdutoController(
        i.get<UpdateProdutoRepository>(), i.args.params["id"])),

    ///Repositories
    //Bind.lazySingleton((i) => AddProdutoRepository(i.get<HasuraConnect>())),
    Bind.lazySingleton(
        (i) => UpdateProdutoRepository(Modular.get<HasuraConnect>())),
    //Outros
    //Bind.lazySingleton((i) => HasuraConnect("https://graphql-hasura-flutter.herokuapp.com/v1/graphql")),
  ];

  @override
  final List<ModularRoute> routes = [
    //ChildRoute('/', child: (_, args) => const UpdateProdutoPage()),
    ChildRoute('/:id',
        child: (_, args) => UpdateProdutoPage(id: args.params['id'])),
  ];
}
