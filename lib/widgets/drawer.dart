import 'package:fish_rescue_app/models/usuario.dart';
import 'package:fish_rescue_app/modules/login/login_page.dart';
import 'package:fish_rescue_app/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: future, builder: (context,snapshot){
                Usuario user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.label_important),
              title: Text("Meus Resgates"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Sobre o APP"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Usuario.clear();
                Navigator.pop(context);
                push(context,LoginPage(),replace:true);
              },
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(user) {
    return UserAccountsDrawerHeader(
            accountName: Text(user.nome),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto),
            ),
          );
  }
}