import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:lojahasura/app/modules/add_produto/add_produto_module.dart';
import 'package:lojahasura/app/modules/update_produto/update_produto_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Outros
    Bind.lazySingleton((i) => HasuraConnect(
        "https://graphql-hasura-flutter.herokuapp.com/v1/graphql")),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    //ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/AddProduto', module: AddProdutoModule()),
    ModuleRoute('/UpdateProduto', module: UpdateProdutoModule()),
  ];
}
