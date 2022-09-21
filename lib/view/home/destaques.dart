import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual_oculos/view/produto/produto_page.dart';

import '../layout.dart';

class HomeDestaques extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: PageScrollPhysics(),
      children: List.generate(3, (int i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProdutoPage(125),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Layout.secondaryLigth(.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/produtos/prod-${i + 1}.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 40,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: FlatButton(
                              child: FaIcon(
                                (i.isEven)
                                    ? FontAwesomeIcons.heart
                                    : FontAwesomeIcons.solidHeart,
                                color: Layout.light(),
                              ),
                              color: Colors.red[300],
                              shape: CircleBorder(),
                              onPressed: () => null,
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Óculos do Reinaldo',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Layout.dark(),
                            ),
                      ),
                      Text(
                        'Reinaldo Jeanequine',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Layout.secondaryDark(),
                            ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'R\$ 568,70',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Layout.primary(),
                                fontSize: 28,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
