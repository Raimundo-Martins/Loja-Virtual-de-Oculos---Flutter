import 'package:flutter/material.dart';
import 'package:loja_virtual_oculos/view/home/roda_categoria.dart';
import 'package:loja_virtual_oculos/view/layout.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Layout.light(),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text('Promoções'),
        ),
        Expanded(
          child: Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.only(right: 20, top: 20, left: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Layout.light(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text('Promoções'),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Categorias',
            style: TextStyle(
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
