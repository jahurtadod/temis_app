import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:temis_app/Hilo/model/routeCurrent.dart';

class CounterStorage {
  String caso = "1";

  CounterStorage({this.caso});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print("Flo ${this.caso}");
    return File('$path/$caso.txt');
  }

  // Future<List<BubbleChat>> readCounter() async {
  //   try {
  //     final file = await _localFile;

  //     List<BubbleChat> _message = <BubbleChat>[];

  //     // Leer archivo

  //     String contents = await file.readAsString();

  //     List<RouteCurrent> _route;

  //     _route = routeCurrentFromJson(contents);
  //     for (var i = 0; i < _route.length; i++) {
  //       _message.insert(
  //           i,
  //           BubbleChat(
  //             message: _route[i].text,
  //             isMe: _route[i].type,
  //             role: _route[i].role,
  //           ));
  //     }
  //     return _message;
  //   } catch (e) {
  //     List<BubbleChat> _message = <BubbleChat>[];
  //     return _message;
  //   }
  // }

  Future<List<RouteCurrent>> readCounterTemp() async {
    try {
      final file = await _localFile;

      List<RouteCurrent> _message = <RouteCurrent>[];
      // Leer archivo
      String contents = await file.readAsString();

      List<RouteCurrent> _route;

      _route = routeCurrentFromJson(contents);
      for (var i = 0; i < _route.length; i++) {
        _message.insert(
            i,
            RouteCurrent(
              text: _route[i].text,
              type: _route[i].type,
              role: _route[i].role,
            ));
      }
      return _message;
    } catch (e) {
      List<RouteCurrent> _message = <RouteCurrent>[];
      return _message;
    }
  }

  Future<File> writeCounter(List<RouteCurrent> _message) async {
    final file = await _localFile;
    print(routeCurrentToJson(_message));
    // Escribir archivo
    return file.writeAsString(routeCurrentToJson(_message));
  }

  Future<File> resetRoute() async {
    final file = await _localFile;

    // Escribir archivo
    return file.writeAsString("");
  }
}
