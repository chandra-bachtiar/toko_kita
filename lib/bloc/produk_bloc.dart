import 'dart:convert';

import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduk() async {
    String apiUrl = ApiUrl.listProduk;

    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<Produk> produk = [];
    for (var p in jsonObj) {
      produk.add(Produk.fromJson(p));
    }
    return produk;
  }

  static Future<Produk> addProduk(
      {required String nama,
      required String harga,
      required String stok,
      required String deskripsi}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      'nama': nama,
      'harga': harga,
      'stok': stok,
      'deskripsi': deskripsi,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Produk.fromJson(jsonObj);
  }

  static Future<Produk> updateProduk(
      {required String id,
      required String nama,
      required String harga,
      required String stok,
      required String deskripsi}) async {
    String apiUrl = ApiUrl.updateProduk(id as int);

    var body = {
      'nama': nama,
      'harga': harga,
      'stok': stok,
      'deskripsi': deskripsi,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Produk.fromJson(jsonObj);
  }

  static Future<Produk> deleteProduk({required String id}) async {
    String apiUrl = ApiUrl.deleteProduk(id as int);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return Produk.fromJson(jsonObj);
  }
}
