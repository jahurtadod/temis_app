import 'package:http/http.dart' show Client;
import 'package:flutter/services.dart' show rootBundle;
import 'package:temis_app/Hilo/model/hilo.dart';

class StorageApi {
  static const baseUrl = 'assets/audiencia.json';

  final Client _client = Client();

  Future<List<Hilo>> getHilo() async {
    List<Hilo> hiloList;


     hiloList =
        hiloFromJson(await rootBundle.loadString(baseUrl)) as List<Hilo>;

    return hiloList;
  }
}
