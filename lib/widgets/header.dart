import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(0, 3))],
          color: Color.fromARGB(255, 48, 48, 48)),
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "images/Stripped_Logo.png",
            width: 30,
          ),
          Text(
            "Sim Racing Fuel Calculator",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }
}
