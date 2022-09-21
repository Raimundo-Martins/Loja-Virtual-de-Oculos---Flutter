import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout.dart';
import 'produto_page.dart';

class CategoriaPage extends StatelessWidget {
  static String tag = '/categoria-page';

  final int id;

  CategoriaPage(this.id);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Layout.primary()),
              hintText: 'Pesquisa',
              contentPadding: const EdgeInsets.only(left: 20),
              isDense: true,
              fillColor: Layout.light(.6),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Layout.primary(.3),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Layout.primary(.3),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: Chip(
                  label: Text('Maior valor',
                      style: TextStyle(color: Layout.light())),
                  backgroundColor: Layout.dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: Chip(
                  label: Text('Menor valor',
                      style: TextStyle(color: Layout.light())),
                  backgroundColor: Layout.dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: Chip(
                  label:
                      Text('de A - Z', style: TextStyle(color: Layout.light())),
                  backgroundColor: Layout.dark(.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: Chip(
                  label:
                      Text('de Z - A', style: TextStyle(color: Layout.light())),
                  backgroundColor: Layout.dark(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: Chip(
                  label: Text('Favoritos',
                      style: TextStyle(color: Layout.light())),
                  backgroundColor: Layout.dark(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Text(
            'Categoria: ${Layout.categoriaPorId(id)['text']}',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.light(),
                ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Nome do produto'),
                            Text('R\$ 125,50',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Layout.primaryLigth(),
                                )),
                            Text(
                              'Um subtítulo',
                              style: TextStyle(color: Layout.dark(.6)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.angleDoubleRight,
                          color: Layout.primaryLigth(),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProdutoPage(125),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );

    return Layout.render(
      context,
      content,
    );
  }
}
