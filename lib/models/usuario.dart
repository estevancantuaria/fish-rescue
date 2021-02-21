class Usuario{
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario(Map<String,dynamic> map){
    nome = map["nome"];
    email = map["email"];
    token = map["token"];
    roles = map["roles"] != null ? map["roles"].map<String>((role)=>role.toString()).toList() : null;
  }

  @override
  String toString(){
    return 'Usuario{login: $login, nome: $nome, token: $token}';
  }
}