import 'package:flutter/material.dart';
import 'package:loja_virtual_oculos/view/favoritos/favoritos_page.dart';

import 'view/layout.dart';
import 'view/carrinho/carrinho_page.dart';
import 'view/compras/compras_page.dart';
import 'view/home/home_page.dart';
import 'view/login/cadastro_page.dart';
import 'view/login/login_page.dart';
import 'view/login/login_recuperar_page.dart';
import 'view/perfil/perfil_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RM - Loja de Óculos',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        primarySwatch: Colors.blue,
        accentColor: Layout.light(),
        textTheme: TextTheme(
          headline6: TextStyle(shadows: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 2,
              color: Layout.dark(.3),
              offset: Offset(2, 2),
            )
          ]),
        ),
      ),
      initialRoute: LoginPage.tag,
      routes: {
        LoginPage.tag: (context) => LoginPage(),
        LoginRecuperarPage.tag: (context) => LoginRecuperarPage(),
        CadastroPage.tag: (context) => CadastroPage(),
        HomePage.tag: (context) => HomePage(),
        FavoritosPage.tag: (context) => FavoritosPage(),
        PerfilPage.tag: (context) => PerfilPage(),
        CarrinhoPage.tag: (context) => CarrinhoPage(),
        ComprasPage.tag: (context) => ComprasPage(),
      },
    );
  }
}
