class Produk {
  int id;
  String kodeProduk;
  String namaProduk;
  int harga;

  Produk({
    required this.id,
    required this.kodeProduk,
    required this.namaProduk,
    required this.harga,
  });

  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
      id: obj['id'] as int,
      kodeProduk: obj['kode_produk'] as String,
      namaProduk: obj['nama_produk'] as String,
      harga: obj['harga'] as int,
    );
  }
}
