import 'dart:convert';

import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/login.dart';

class LoginBloc {
  static Future<Login> login(
      {required String email, required String password}) async {
    String apiUrl = ApiUrl.login;

    var body = {
      'email': email,
      'password': password,
    };

    var response = await Api().post(apiUrl, body);
    //print response from api
    print('response api : $response');

    var jsonObj = json.decode(response);
    return Login.fromJson(jsonObj);
  }
}
