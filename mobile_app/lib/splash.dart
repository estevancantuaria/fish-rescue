import 'package:fish_rescue_app/modules/login/login_page.dart';
import 'package:fish_rescue_app/widgets/clip-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final clipperBottom = ClipBottom();
  final clipTop = ClipTopOne();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipPath(
              clipper: clipTop,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/logo_if.png",
                width: 300,
                height: 300,
              ),
            ),
            ClipPath(
              clipper: clipperBottom,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.blue,
              ),
            )
          ],
        ),
    );
  }
}



