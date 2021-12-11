import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lojahasura/app/modules/add_produto/add_produto_controller.dart';
import 'package:lojahasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:lojahasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:lojahasura/app/shared/widgets/label_widget.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key? key, this.title = 'Adicionar Produto'})
      : super(key: key);
  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  AddProdutoController addProdutoController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height - 250,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const LabelWidget(
                    title: "Descricao:",
                  ),
                  TextField(
                    onChanged: addProdutoController.setDescricao,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      hintText: "Descrição do Produto",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LabelWidget(
                    title: "Valor:",
                  ),
                  TextField(
                    onChanged: addProdutoController.setValor,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      hintText: "Valor do Produto",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LabelWidget(
                    title: "Categoria do Produto:",
                  ),
                  //itemSelecionado: Model("default", "Selecione um item"),
                  Observer(
                    builder: (BuildContext context) {
                      if (addProdutoController.tipoProduto == null) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ));
                      }

                      return CustomComboboxWidget(
                        items: addProdutoController
                            .tipoProduto!.categoriaProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => {
                          addProdutoController
                              .setSelectedCategoria(TipoECategoriaDto(
                            id: tipo!.id,
                            descricao: tipo.descricao,
                          )),
                        },
                        itemSelecionado: Model("default", "Selecione um item"),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LabelWidget(
                    title: "Tipo do Produto:",
                  ),

                  Observer(
                    builder: (BuildContext context) {
                      if (addProdutoController.tipoProduto == null) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ));
                      }
                      return CustomComboboxWidget(
                        items: addProdutoController.tipoProduto!.tipoProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => {
                          addProdutoController
                              .setSelectedTipo(TipoECategoriaDto(
                            id: tipo!.id,
                            descricao: tipo.descricao,
                          )),
                        },
                        itemSelecionado: Model("default", "Selecione um item"),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () async {
                        var result = await addProdutoController.salvar();

                        if (result) {
                          Navigator.of(context).pop();
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: const Text(
                                        "Você deve informar todos os campos!"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Fechar"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
