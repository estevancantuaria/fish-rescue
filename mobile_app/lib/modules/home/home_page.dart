import 'package:fish_rescue_app/modules/rescue-form/rescue_form.dart';
import 'package:fish_rescue_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(top: 2), child: Text("Menu")),
          centerTitle: true,
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
          margin: EdgeInsets.only(
            top: 85,
            bottom:14,
            right: 15,
            left: 15
          ),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://static.portaldacidade.com/unsafe/1150x767/https://s3.amazonaws.com/umuarama.portaldacidade.com/img/news/2020-10/resolucao-proibe-a-pesca-de-algumas-especies-antes-da-piracema-no-parana-5f8dd1dcdb665.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 46, bottom: 46),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StepperDemo()));
                    },
                    child: Text(
                      "Iniciar um Novo Resgate",
                      style: TextStyle(fontSize: 27, color: Colors.white),
                    ),
                  ),
                )),
          ]),
        ),
          Container(
          margin: EdgeInsets.only(
            top: 82,
            bottom:14,
            right: 15,
            left: 15
          ),
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
                child: Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 46, bottom: 46),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StepperDemo()));
                    },
                    child: Text(
                      "Lista de Usinas Cadastradas",
                      style: TextStyle(fontSize: 27, color: Colors.white),
                    ),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
