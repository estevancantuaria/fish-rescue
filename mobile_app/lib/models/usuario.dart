import 'package:fish_rescue_app/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario {
  int id;
  String name;
  String email;
  String token;
  // List<String> roles;

  Usuario(
      {this.id,
      this.name,
      this.email,
      this.token,
      // this.roles
      });

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    // roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    // data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("user_prefs", json);
  }

  static Future<Usuario> get() async{
    String json = await Prefs.getString("user_prefs");
    if(json.isEmpty){
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromJson(map);
    return user;
  }

  static void clear() {
    Prefs.setString("user_prefs", "");
  }
}