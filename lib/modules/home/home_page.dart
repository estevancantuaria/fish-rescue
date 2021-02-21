import 'package:fish_rescue_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
        centerTitle: true,
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top:8),
        child: ListView(
          children: [
            Container(
              height: 237,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image.network(
                      "https://www.ofitexto.com.br/wp-content/uploads/2018/06/Vertedouro-da-UHE-de-Tucuru%C3%AD-Foto-cortesia-Eletronorte.jpg",
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                      "Iniciar Novo Resgate",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    )),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(20),
              ),
            ),
            Container(
              height: 237,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image.network(
                      "https://www.ofitexto.com.br/wp-content/uploads/2018/06/Vertedouro-da-UHE-de-Tucuru%C3%AD-Foto-cortesia-Eletronorte.jpg",
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                      "Lista de Usinas",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    )),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(20),
              ),
            ),
            Container(
              height: 237,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Image.network(
                      "https://www.ofitexto.com.br/wp-content/uploads/2018/06/Vertedouro-da-UHE-de-Tucuru%C3%AD-Foto-cortesia-Eletronorte.jpg",
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                      "Lista de Espécies",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    )),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
