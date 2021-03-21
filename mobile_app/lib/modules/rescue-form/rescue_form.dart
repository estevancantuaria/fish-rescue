import 'package:fish_rescue_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
    final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
                  child: AppBar(
              title: Text('Formulário de Resgate'),
            centerTitle: true,
          ),
        ),
        body:  Form(
          key: _formKey,
                  child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    type: StepperType.vertical,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue:  _currentStep==2?null:continued,
                    onStepCancel: cancel,
                    steps: <Step>[
                       Step(
                        title: new Text('Informações Gerais'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Email Address'),
                              controller: _tLogin,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Password'),
                              controller: _tSenha,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0 ?
                        StepState.complete : StepState.disabled,
                      ),
                       Step(
                        title: new Text('Local do Resgate'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Home Address'),
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1 ?
                        StepState.complete : StepState.disabled,
                      ),
                       Step(
                        title: new Text('Espécie Resgatada'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Mobile Number'),
                            ),
                          ],
                        ),
                        isActive:_currentStep >= 0,
                        state: _currentStep >= 2 ?
                        StepState.complete : StepState.disabled,
                      ),
                    ],
                  ),
                ),
               _currentStep==2? AppButton("Salvar", onPressed: _onClick,) : Text("")
              ],
            ),
          ),
        ),
        
    );
  }

  _onClick(){
        String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
        setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }
}