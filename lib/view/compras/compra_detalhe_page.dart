import 'package:flutter/material.dart';

import '../layout.dart';

class CompraDetalhePage extends StatelessWidget {
  static String tag = '/compra-detalhe-page';

  final int id;

  CompraDetalhePage(this.id);

  @override
  Widget build(BuildContext context) {
    var content = Container(
      decoration: BoxDecoration(
        color: Layout.light(),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Em 20/03/2020 às 14:36'),
          Text('Status: Em análise'),
          SizedBox(height: 10),
          Text('Total em Itens: R\$ 70,00'),
          Text('Frete por PAC: R\$ 30,00'),
          SizedBox(height: 10),
          Text('Total: R\$ 100,00'),
          SizedBox(height: 20),
          Text('Itens:', style: TextStyle(fontSize: 18)),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Layout.dark(.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'http://i.picsum.photos/id/${i + 50}/70/70.jpg'),
                    ),
                    title: Text('Óculos Lindão'),
                    subtitle: Text('3 X R\$ 15,00'),
                    trailing: Text('R\$45,00'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    return Layout.render(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Text(
              'Compra #$id',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Layout.light(),
                  ),
            ),
          ),
          Expanded(child: content),
        ],
      ),
      bottomItemSelected: 1,
    );
  }
}
