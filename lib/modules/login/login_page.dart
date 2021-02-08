import 'package:fish_rescue_app/widgets/clip-widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                child: _text("E-mail", "Digite seu e-mail",
                    controller: _tLogin, validator: _validateEmail),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 12, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: _text("Senha", "Digite sua senha",
                    password: true, controller: _tSenha, validator: _validateSenha),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    _onClickLogin();
                  },
                  child: Text(
                    'Logar',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
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

  TextFormField _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: label, hintText: hint),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
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
