import 'package:flutter/material.dart';

import './destaques.dart';
import './promo_banners.dart';
import './roda_categoria.dart';
import '../layout.dart';

class HomePage extends StatelessWidget {
  static String tag = '/home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 1, child: PromoBanners()),
        SizedBox(height: 10),
        Expanded(
          flex: 2,
          child: HomeDestaques(),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Categorias',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.light(),
                ),
          ),
        ),
        Container(
          height: 100,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: RodaCategoria(),
          ),
        ),
      ],
    );
    return Layout.render(
      context,
      content,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   child: Icon(Icons.plus_one),
      // ),
      bottomItemSelected: 0,
    );
  }
}
