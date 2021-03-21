import 'dart:convert';

import 'package:fish_rescue_app/models/usuario.dart';
import 'package:fish_rescue_app/utils/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String email, String senha) async {
    try {
      var url = 'http://10.0.2.2:3333/auth/';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"email": email, "password": senha};

      String s = json.encode(params);

      var response = await http.post(url, body: s, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    }catch(error){
      print("Erro no login $error ");
      return ApiResponse.error("Não foi possivel fazer login");
    }
  }
}



