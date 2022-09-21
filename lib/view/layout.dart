import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual_oculos/view/compras/compras_page.dart';
import 'package:loja_virtual_oculos/view/favoritos/favoritos_page.dart';
import 'package:loja_virtual_oculos/view/home/home_page.dart';
import 'package:loja_virtual_oculos/view/login/login_page.dart';

import 'carrinho/carrinho_page.dart';
import 'perfil/perfil_page.dart';

class Layout {
  static Widget render(
    BuildContext context,
    Widget child, {
    Widget floatingActionButton,
    int bottomItemSelected,
  }) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.userCog,
                            color: Layout.light(),
                            size: 24,
                          ),
                          onTap: () => Navigator.of(context)
                              .popAndPushNamed(PerfilPage.tag),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Text('Loja - RM',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Layout.light(),
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  )),
                          onTap: () => Navigator.of(context)
                              .popAndPushNamed(PerfilPage.tag),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed(CarrinhoPage.tag),
                          child: FaIcon(
                            FontAwesomeIcons.shoppingBag,
                            color: Layout.primaryLigth(),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      backgroundColor: Layout.secondary(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: FaIcon(FontAwesomeIcons.umbrellaBeach, size: 30),
          ),
          BottomNavigationBarItem(
            title: Text('Compras'),
            icon: FaIcon(FontAwesomeIcons.solidStar, size: 30),
          ),
          BottomNavigationBarItem(
            title: Text('Favoritos'),
            icon: FaIcon(FontAwesomeIcons.solidHeart, size: 30),
          ),
          BottomNavigationBarItem(
            title: Text('Sair'),
            icon: FaIcon(FontAwesomeIcons.signOutAlt, size: 30),
          ),
        ],
        currentIndex: bottomItemSelected ?? 0,
        selectedItemColor: (bottomItemSelected == null)
            ? Layout.dark(.3)
            : Layout.primaryLigth(),
        unselectedItemColor: Layout.dark(.3),
        backgroundColor: Layout.light(),
        type: BottomNavigationBarType.fixed,
        onTap: (int i) {
          switch (i) {
            case 0:
              Navigator.of(context).popAndPushNamed(HomePage.tag);
              break;
            case 1:
              Navigator.of(context).popAndPushNamed(ComprasPage.tag);
              break;
            case 2:
              Navigator.of(context).popAndPushNamed(FavoritosPage.tag);
              break;
            case 3:
              Navigator.of(context).popAndPushNamed(LoginPage.tag);
              break;
            default:
          }
        },
      ),
    );
  }

  static List<Map<String, dynamic>> categorias = const [
    {"id": '1', "icon": Icons.favorite, "text": 'Estilo'},
    {"id": '2', "icon": Icons.filter_drama, "text": 'Teen'},
    {"id": '3', "icon": Icons.flight, "text": 'Viagem'},
    {"id": '4', "icon": Icons.store_mall_directory, "text": 'Trabalho'},
    {"id": '5', "icon": Icons.style, "text": 'Casual'},
    {"id": '6', "icon": Icons.supervised_user_circle, "text": 'Execultivo'},
    {"id": '7', "icon": Icons.switch_video, "text": 'Esporte'},
    {"id": '8', "icon": Icons.thumb_up, "text": 'Classico'},
  ];

  static Map<String, dynamic> categoriaPorId(int id) {
    return Layout.categorias.firstWhere((e) => e['id'] == id);
  }

  static Color primary([double opacity = 1]) =>
      Color(0xff195738).withOpacity(opacity);
  static Color primaryLigth([double opacity = 1]) =>
      Color(0xff007d40).withOpacity(opacity);
  static Color primaryDark([double opacity = 1]) =>
      Color(0xff123D27).withOpacity(opacity);

  static Color secondary([double opacity = 1]) =>
      Color(0xffddc199).withOpacity(opacity);
  static Color secondaryLigth([double opacity = 1]) =>
      Color(0xffE0CF9D).withOpacity(opacity);
  static Color secondaryDark([double opacity = 1]) =>
      Color(0xffce9150).withOpacity(opacity);
  static Color secondaryHight([double opacity = 1]) =>
      Color(0xffFDAC25).withOpacity(opacity);

  static Color light([double opacity = 1]) =>
      Color(0xfff0ece1).withOpacity(opacity);
  static Color dark([double opacity = 1]) =>
      Color(0xff333333).withOpacity(opacity);
}
