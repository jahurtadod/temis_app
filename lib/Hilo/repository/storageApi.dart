import 'package:flutter/services.dart' show rootBundle;
import 'package:temis_app/Hilo/model/hilo.dart';

class StorageApi {
  static const baseUrl = 'assets/audiencia2.json';

  Future<Hilo> getHilo() async {
    Hilo hiloList;

    hiloList = hiloFromJson(await rootBundle.loadString(baseUrl));

    return hiloList;
  }
}
