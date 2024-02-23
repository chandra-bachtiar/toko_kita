import 'package:flutter/material.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({super.key, required this.produk});

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Center(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kode Produk",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.produk.kodeProduk,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nama Produk",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.produk.namaProduk,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Harga Produk",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    formatRupiah(widget.produk.harga),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 100, child: _tombolHapusEdit()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatRupiah(int amount) {
    // Ubah angka menjadi string dan reverse agar mudah dimasukkan separator
    String amountString = amount.toString().split('').reversed.join();

    // Buat variabel untuk menampung hasil format
    String formattedAmount = '';

    // Lakukan iterasi terhadap string angka yang sudah direverse
    for (int i = 0; i < amountString.length; i++) {
      // Tambahkan separator setiap 3 digit
      if (i % 3 == 0 && i != 0) {
        formattedAmount += '.';
      }
      // Tambahkan digit angka
      formattedAmount += amountString[i];
    }

    // Balik kembali string agar urutan digit benar
    formattedAmount = formattedAmount.split('').reversed.join();

    // Tambahkan prefix 'Rp. ' sebelum angka
    formattedAmount = 'Rp. $formattedAmount';

    return formattedAmount;
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(produk: widget.produk),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          child: const Text("Edit"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            confirmHapus();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text("Hapus"),
        ),
      ],
    );
  }

  void confirmHapus() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: const SizedBox(
          height: 100, // Set a specific height for the content area
          child: SingleChildScrollView(
            child: Text("Apakah anda yakin ingin menghapus produk ini?"),
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdukForm(produk: widget.produk)));
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }
}
