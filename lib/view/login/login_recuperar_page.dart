import 'package:flutter/material.dart';
import 'package:loja_virtual_oculos/view/home/home_page.dart';
import 'package:loja_virtual_oculos/view/login/cadastro_page.dart';

import '../layout.dart';
import 'login_page.dart';

class LoginRecuperarPage extends StatelessWidget {
  static String tag = '/login-recuperar-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Layout.secondary(),
      body: Stack(
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  right: 40,
                  bottom: 20,
                  left: 40,
                ),
                child: Image.asset('assets/images/logo-sem-fundo.png'),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Layout.light(),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 2,
                            color: Layout.dark(.4),
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () => Navigator.of(context)
                                  .popAndPushNamed(LoginPage.tag),
                              child: Text(
                                'Fazer Login',
                                style: TextStyle(
                                  color: Layout.secondaryDark(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              color: Layout.primary(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: () => Navigator.of(context)
                                  .popAndPushNamed(HomePage.tag),
                              child: Text(
                                'RECUPERAR SENHA',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                        color: Layout.light(), fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          child: Text('Não tem uma conta? CADASTRE-SE'),
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed(CadastroPage.tag),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
