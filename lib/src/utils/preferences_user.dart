import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class PreferencesUser {
  //patron singleton
  /*Inicializa la misma Instancia siempre que
  se quiera llamar la clase
  */
  static final PreferencesUser _instancia = PreferencesUser._internal();

  factory PreferencesUser() {
    return _instancia;
  }
  PreferencesUser._internal();

  late SharedPreferences _prefs;

  //inicialzia las prefs
  initiPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    //await _loadConfigDB();
  }

  //Nombre de base de datos
  // ?? comprueba si es nulo entonces retorna ''
  Future _loadConfigDB() async {
    String raw = await rootBundle.loadString("assets/files/database.json");
    final dataJson = json.decode(raw);

    List<String> data = [
      dataJson["user"],
      dataJson["host"],
      dataJson["port"].toString(),
      dataJson["password"],
      dataJson["data_base_name"]
    ];
    this._prefs.setStringList('server', data);
  }

  set dataUser(String data) {
    this._prefs.setString('dataUserAuth', data);
  }

  String get dataUser => this._prefs.getString('dataUserAuth') ??'';
}
