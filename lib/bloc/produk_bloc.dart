import 'dart:convert';

import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduk() async {
    String apiUrl = ApiUrl.listProduk;

    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response);
    List<Produk> produk = [];
    for (var p in jsonObj['data']) {
      produk.add(Produk.fromJson(p));
    }
    return produk;
  }

  static Future<Produk> addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      'kode_produk': produk!.kodeProduk,
      'nama_produk': produk.namaProduk,
      'harga': produk.harga.toString(),
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response);
    return Produk.fromJson(jsonObj);
  }

  static Future updateProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk!.id);

    var body = {
      'kode_produk': produk.kodeProduk,
      'nama_produk': produk.namaProduk,
      'harga': produk.harga.toString(),
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response);
    return jsonObj;
  }

  static Future<Produk> deleteProduk({required String id}) async {
    String apiUrl = ApiUrl.deleteProduk(id as int);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return Produk.fromJson(jsonObj);
  }
}
