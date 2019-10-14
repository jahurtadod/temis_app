import 'package:flutter/material.dart';
// import 'package:temis_app/Hilo/repository/dataTempHilo.dart';
// import 'Hilo/ui/screens/chatCaso.dart';
import 'User/ui/screens/seleccionCaso.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temis Ascendere',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectCase(),
      // home: ChatCaso(storage: CounterStorage()),
    );
  }
}
