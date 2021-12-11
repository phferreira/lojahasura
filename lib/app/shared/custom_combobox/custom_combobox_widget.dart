import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final Function(Model?) onChange;
  final Model itemSelecionado;
  //final String errorText;

  const CustomComboboxWidget({
    Key? key,
    required this.items,
    required this.onChange,
    required this.itemSelecionado,
    //this.errorText = 'default',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FindDropdown<Model>(
          //label: 'Pesquisar',
          emptyBuilder: (BuildContext context) => const Center(
            child: Text(
              "Não há registros",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          searchBoxDecoration: const InputDecoration(
              hintText: "Pesquisar", border: OutlineInputBorder()),
          items: items,
          onChanged: onChange,
          selectedItem: itemSelecionado,

          validate: (Model? item) {
            if (item!.id == "default") {
              return "Você precisa selecionar um valor.";
            } else {
              return null;
            }
          },

          dropdownBuilder: (_, model) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: model?.id == null
                  ? ListTile(
                      title: Text(
                        "Selecione um item",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        model!.descricao,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
            );
          },
        ),
        /*
        if (errorText != "default")
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        if (errorText == "default")
          const SizedBox(
            height: 20,
          )
          */
      ],
    );
  }
}

class Model {
  final String id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() => descricao.toString();

  @override
  // ignore: avoid_renaming_method_parameters
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
