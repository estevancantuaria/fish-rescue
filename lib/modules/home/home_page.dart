import 'package:fish_rescue_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
              child: AppBar(
          title: Text('Menu Principal'),
          centerTitle: true,
        ),
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Card(
              child: Stack(
                children: [
                  Image.network(
                      "https://www.epagri.sc.gov.br/wp-content/uploads/2019/08/piscicultura-sc.jpg"),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 140),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 23),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Iniciar Resgate",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Card(
              child: Stack(
                children: [
                  Image.network(
                      "https://www.ofitexto.com.br/wp-content/uploads/2018/06/Vertedouro-da-UHE-de-Tucuru%C3%AD-Foto-cortesia-Eletronorte.jpg"),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 163),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 23),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Lista de Usinas",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Card(
              child: Stack(
                children: [
                  Image.network(
                      "https://i0.wp.com/files.agro20.com.br/uploads/2020/09/Peixes-de-%C3%A1gua-salgada-5.jpg?resize=1024%2C576&ssl=1"),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 158),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 23),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Lista de Espécies",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
