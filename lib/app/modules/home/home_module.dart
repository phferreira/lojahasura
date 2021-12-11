import 'package:hasura_connect/hasura_connect.dart';
import 'package:lojahasura/app/modules/home/repositories/home_repository.dart';
import 'package:lojahasura/app/modules/home/widgets/card_produto/card_produto_controller.dart';
import 'package:lojahasura/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lojahasura/app/modules/home/home_page.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind.lazySingleton((i) => CardProdutoController()),
    Bind.lazySingleton((i) => HomeController(i.get<HomeRepository>())),
    //Repositories
    //Bind.lazySingleton((i) => HomeRepository(i.get<HasuraConnect>())),
    Bind.lazySingleton((i) => HomeRepository(Modular.get<HasuraConnect>())),
    //Outros
    //Bind.lazySingleton((i) => HasuraConnect("https://graphql-hasura-flutter.herokuapp.com/v1/graphql")),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
//