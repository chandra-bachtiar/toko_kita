import 'dart:convert';

import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {required String nama,
      required String email,
      required String password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {
      'nama': nama,
      'email': email,
      'password': password,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response);
    return Registrasi.fromJson(jsonObj);
  }
}
