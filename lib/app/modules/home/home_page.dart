import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lojahasura/app/modules/home/home_controller.dart';
//import 'package:lojahasura/app/modules/home/home_module.dart';
import 'package:lojahasura/app/modules/home/widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
          builder: (context) {
            if (homeController.listaProdutos.hasError) {
              debugPrint(homeController.listaProdutos.error);
              return const Center(
                child: Text("Ocorreu um erro ao realizar essa requisição."),
              );
            }
 
            if (homeController.listaProdutos.value == null) {
              return const Center(child: CircularProgressIndicator());
            }
 
            homeController.listaProdutos.value!.sort((produto1, produto2) => produto1
                .nome
                .toLowerCase()
                .compareTo(produto2.nome.toLowerCase()));
            return ListView.builder(
              itemCount: homeController.listaProdutos.value!.length,
              itemBuilder: (context, index) {
                return CardProdutoWidget(
                  nomeProduto: homeController.listaProdutos.value![index].nome,
                  valor: homeController.listaProdutos.value![index].valor.toString(),
                  categoriaProduto: homeController
                      .listaProdutos.value![index].categoriaProduto.descricao,
                  tipoProduto: homeController
                      .listaProdutos.value![index].tipoProduto.descricao,
                  idProduto: homeController.listaProdutos.value![index].id,
                );
              },
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/AddProduto/");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
