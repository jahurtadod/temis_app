import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';

class JudgmentScreen extends StatefulWidget {
  final Judgment judgament;

  JudgmentScreen({Key key, this.judgament}) : super(key: key);

  @override
  _JudgmentScreenState createState() => _JudgmentScreenState();
}

class _JudgmentScreenState extends State<JudgmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Text(
            "Audiencia 1",
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.grey,
                fontFamily: "Comfortaa",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 36.0),
          ),
          Text(widget.judgament.resolution),
          Text(widget.judgament.description),
          Expanded(
            child: Container(),
          ),
          Text("Finalizar",
              style: const TextStyle(
                  color: const Color(0xff00adb5),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Comfortaa",
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.left),
        ],
      ),
    )));
  }
}
