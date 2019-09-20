import 'package:flutter/material.dart';

class SeleccionCaso extends StatefulWidget {
  @override
  _SeleccionCasoState createState() => _SeleccionCasoState();
}

class _SeleccionCasoState extends State<SeleccionCaso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Audencias", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}