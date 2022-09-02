import 'package:flutter/material.dart';

import 'dart:math';

import '../layout.dart';

enum SwypeDirection { left, right }

class RodaCategoria extends StatefulWidget {
  @override
  State<RodaCategoria> createState() => _RodaCategoriaState();
}

class _RodaCategoriaState extends State<RodaCategoria>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _startDeg = 0;
  double _endDeg = 0;
  double _dragInitial = 0;

  SwypeDirection _swypeDirection;

  int _currentItem = 0;

  final List<Map<String, dynamic>> itens = const [
    {"id": '1', "icon": Icons.favorite, "text": 'Estilo'},
    {"id": '2', "icon": Icons.filter_drama, "text": 'Teen'},
    {"id": '3', "icon": Icons.flight, "text": 'Viagem'},
    {"id": '4', "icon": Icons.store_mall_directory, "text": 'Trabalho'},
    {"id": '5', "icon": Icons.style, "text": 'Casual'},
    {"id": '6', "icon": Icons.supervised_user_circle, "text": 'Execultivo'},
    {"id": '7', "icon": Icons.switch_video, "text": 'Esporte'},
    {"id": '8', "icon": Icons.thumb_up, "text": 'Classico'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(2, 0),
                color: Layout.dark(.3),
              )
            ],
          ),
        ),
        RotationTransition(
          turns: Tween(begin: _startDeg, end: _endDeg).animate(_controller),
          child: GestureDetector(
            /* onTap: () {
              _controller.reset();
              _startDeg = _endDeg;
              _endDeg += (1 / itens.length);
              setState(() {
                _controller.forward();
              });
            }, */
            onHorizontalDragStart: (details) {
              _dragInitial = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (details) {
              _swypeDirection = SwypeDirection.right;

              if ((details.globalPosition.dx - _dragInitial) < 0) {
                _swypeDirection = SwypeDirection.left;
              }
            },
            onHorizontalDragEnd: (details) {
              _startDeg = _endDeg;
              _controller.reset();

              switch (_swypeDirection) {
                case SwypeDirection.left:
                  _endDeg -= (1 / itens.length);
                  _currentItem++;
                  if (_currentItem > itens.length - 1) {
                    _currentItem = 0;
                  }
                  break;
                case SwypeDirection.right:
                  _endDeg += (1 / itens.length);
                  _currentItem--;
                  if (_currentItem < 0) {
                    _currentItem = itens.length - 1;
                  }
                  break;
                default:
              }

              _swypeDirection = null;
              setState(() {
                _controller.forward();
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Layout.secondaryDark(),
                shape: BoxShape.circle,
              ),
              child: Stack(children: _getCategorias()),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _getCategorias() {
    List<Widget> result = [];

    /* result.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.width,
        ),
        child: Image.asset('', fit: BoxFit.cover),
      ),
    ); */

    var angleFactor = (pi * 2) / itens.length;
    var angle = -angleFactor;

    for (Map<String, dynamic> item in itens) {
      angle += angleFactor;
      result.add(
        Transform.rotate(
          angle: angle,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8),
                Icon(item['icon'], size: 32, color: Layout.light()),
                SizedBox(height: 5),
                Text(
                  '${item['text']}'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Layout.light()),
                )
              ],
            ),
          ),
        ),
      );
    }

    return result;
  }

  /* List<Map<String, dynamic>> _getListaCategorias() {
    return [
      {"icon": Icons.favorite, "text": 'Estilo'},
      {"icon": Icons.filter_drama, "text": 'Teen'},
      {"icon": Icons.flight, "text": 'Viagem'},
      {"icon": Icons.store_mall_directory, "text": 'Trabalho'},
      {"icon": Icons.style, "text": 'Casual'},
      {"icon": Icons.supervised_user_circle, "text": 'Execultivo'},
      {"icon": Icons.switch_video, "text": 'Esporte'},
      {"icon": Icons.thumb_up, "text": 'Classico'},
    ];
  } */
}
