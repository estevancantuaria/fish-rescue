class Usuario{
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario(Map<String,dynamic> map){
    nome = map["nome"];
    email = map["email"];
  }

  @override
  String toString(){
    return 'Usuario{login: $login, nome: $nome}';
  }
}