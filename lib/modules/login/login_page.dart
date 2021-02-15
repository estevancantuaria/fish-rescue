import 'package:fish_rescue_app/models/usuario.dart';
import 'package:fish_rescue_app/modules/home/home_page.dart';
import 'package:fish_rescue_app/modules/login/login_api.dart';
import 'package:fish_rescue_app/widgets/app_button.dart';
import 'package:fish_rescue_app/widgets/app_text.dart';
import 'package:fish_rescue_app/widgets/clip-widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final clipperBottom = ClipBottom();

  final clipTop = ClipTopOne();

  var _tLogin = TextEditingController();

  var _tSenha = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(child: _body(context));
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            // horizontal).
            children: <Widget>[
              ClipPath(
                clipper: clipTop,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Center(
                  child: Container(
                      child: Image.asset(
                    "assets/images/logo_if.png",
                    width: 170,
                    height: 170,
                  )),
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: AppText("E-mail", "Digite seu e-mail",
                    controller: _tLogin, validator: _validateEmail),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 12, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: AppText("Senha", "Digite sua senha",
                    password: true,
                    controller: _tSenha,
                    validator: _validateSenha),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              AppButton("Login", _onClickLogin),
              SizedBox(
                height: 203,
              ),
              Text('Novo no App? Crie sua conta')
            ],
          ),
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
    Usuario user = await LoginApi.login(login, senha);
    if(user!=null){
      print(">>>$user");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      print('login incorreto');
    }
  }

  String _validateEmail(String text) {
    if (text.isEmpty) {
      return "Digite o texto";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }
}
