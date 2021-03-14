
import 'dart:async';

import 'package:fish_rescue_app/models/usuario.dart';
import 'package:fish_rescue_app/modules/login/login_api.dart';
import 'package:fish_rescue_app/utils/api_response.dart';

class LoginBloc{

  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    _streamController.add(false);

    return response;
  }

  void dispose(){
    _streamController.close();
  }

}