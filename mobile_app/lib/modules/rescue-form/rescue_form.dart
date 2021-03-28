import 'package:fish_rescue_app/models/rescue.dart';
import 'package:fish_rescue_app/models/usuario.dart';
import 'package:fish_rescue_app/modules/rescue-form/rescue_api.dart';
import 'package:fish_rescue_app/utils/api_response.dart';
import 'package:fish_rescue_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _nomeUsina = TextEditingController();

  final _condicoesClimaticas = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Formulário de Resgate'),
          centerTitle: true,
        ),
      ),
      body: Form(
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
                  onStepContinue:null, //_currentStep == 2 ? null : continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Informações Gerais'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nome da Usina'),
                            controller: _nomeUsina,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Condições Climaticas'),
                            controller: _condicoesClimaticas,
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    // Step(
                    //   title: new Text('Local do Resgate'),
                    //   content: Column(
                    //     children: <Widget>[
                    //       TextFormField(
                    //         decoration:
                    //             InputDecoration(labelText: 'Home Address'),
                    //       ),
                    //     ],
                    //   ),
                    //   isActive: _currentStep >= 0,
                    //   state: _currentStep >= 1
                    //       ? StepState.complete
                    //       : StepState.disabled,
                    // ),
                    // Step(
                    //   title: new Text('Espécie Resgatada'),
                    //   content: Column(
                    //     children: <Widget>[
                    //       TextFormField(
                    //         decoration:
                    //             InputDecoration(labelText: 'Mobile Number'),
                    //       ),
                    //     ],
                    //   ),
                    //   isActive: _currentStep >= 0,
                    //   state: _currentStep >= 2
                    //       ? StepState.complete
                    //       : StepState.disabled,
                    // ),
                  ],
                ),
              ),
              _currentStep == 0
                  ? AppButton(
                      "Salvar",
                      onPressed: _onClick,
                    )
                  : Text(""),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  _onClick() async {
    String usina = _nomeUsina.text;
    String condicoes = _condicoesClimaticas.text;
    Usuario user = await Usuario.get();
    var c = new Rescue();
    c.condicoesClimaticas = condicoes;
    c.nomeUsina = usina;
    c.userId = user.id;
    ApiResponse<bool> response = await RescueApi.save(c);
    print(user.id);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
