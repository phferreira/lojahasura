import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valor;
  final String idProduto;

  const CardProdutoWidget(
      {Key? key,
      required this.nomeProduto,
      required this.categoriaProduto,
      required this.tipoProduto,
      required this.valor,
      required this.idProduto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/UpdateProduto/$idProduto');
        // ignore: avoid_print
        //print('Update produto, id: $idProduto');
      },
      child: Card(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: -50,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
              ),
            ),
            Positioned(
              top: 100,
              right: 50,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
              ),
            ),
            Positioned(
              top: 120,
              right: 150,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nomeProduto,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(categoriaProduto,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(tipoProduto,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18))),
                      Text(
                        "R\$ ${double.parse(valor).toStringAsFixed(2).replaceAll('.', ',')}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
