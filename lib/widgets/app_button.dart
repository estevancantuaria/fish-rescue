import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function _onPressed;
  
  AppButton(this.text,this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: FlatButton(
        onPressed: _onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}


