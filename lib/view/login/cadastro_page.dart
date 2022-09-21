import 'package:flutter/material.dart';
import 'package:loja_virtual_oculos/view/home/home_page.dart';
import 'package:loja_virtual_oculos/view/login/login_page.dart';

import '../layout.dart';

class CadastroPage extends StatelessWidget {
  static String tag = '/cadastro-page';

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
                              hintText: 'Nome',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
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
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Senha',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Confirmar Senha',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Layout.primary(),
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
                                'CRIAR CONTA',
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
                          child: Text('Já tem uma conta? FAZER LOGIN'),
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed(LoginPage.tag),
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
