import 'package:fish_rescue_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Menu principal'),
          centerTitle: false,
        ),
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return PageView(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://www.grupoaguasclaras.com.br/wp-content/uploads/alevinos-de-piracanjuba-800x586.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.only(left: 12,top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(0)),
                  child: Text(
                    "Iniciar um novo resgate",
                    style: TextStyle(fontSize: 39, color: Colors.white),
                  ),
                )),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://www.ofitexto.com.br/wp-content/uploads/2018/06/Vertedouro-da-UHE-de-Tucuru%C3%AD-Foto-cortesia-Eletronorte.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    print("container apertado");
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.only(left: 12,top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                       ),
                    child: Text(
                      "Lista de úsinas cadastradas",
                      style: TextStyle(fontSize: 39, color: Colors.white),
                    ),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
