import 'package:flutter/material.dart';
import 'package:loja_virtual_oculos/view/layout.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    var content = Column();
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
