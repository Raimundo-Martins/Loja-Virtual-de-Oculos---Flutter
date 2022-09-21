import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual_oculos/view/layout.dart';

class CarrinhoPage extends StatelessWidget {
  static String tag = '/carrinho';

  @override
  Widget build(BuildContext context) {
    var temFrete = false;

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'Carrinho',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.light(),
                ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 18,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: BoxDecoration(
                  color: Layout.light(),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 3),
                      color: Layout.dark(.1),
                    ),
                  ],
                ),
                child: Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                            'http://i.picsum.photos/id/${i + 50}/70/70.jpg'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Nome do produto'),
                            SizedBox(height: 5),
                            Text(
                              'Um subtítulo',
                              style: TextStyle(color: Layout.dark(.6)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('R\$ 125,50'),
                          Container(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => print('Esquerda'),
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronLeft,
                                    size: 16,
                                  ),
                                ),
                                Text('1', style: TextStyle(fontSize: 18)),
                                GestureDetector(
                                  onTap: () => print('Direita'),
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Layout.light(),
          ),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      color: Layout.dark(.1),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: temFrete
                          ? Text('PAC', style: TextStyle(fontSize: 24))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.truck),
                                  color: Layout.primaryDark(),
                                  onPressed: () => null,
                                ),
                                Text(
                                  'Selecione o Frete',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('5 Produtos:'),
                            Text('Frete:'),
                            SizedBox(height: 10),
                            Text(
                              'Total:',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('R\$ 150,00'),
                          Text('R\$ 15,80'),
                          SizedBox(height: 10),
                          Text(
                            'R\$ 165,80',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: temFrete ? () => null : null,
              color: Layout.primary(),
              disabledColor: Layout.primary(.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Finalizar Compra',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Layout.light(),
                      fontSize: 18,
                    ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );

    return Layout.render(context, content);
  }
}
