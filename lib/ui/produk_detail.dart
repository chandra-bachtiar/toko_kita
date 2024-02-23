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
          child: Column(
            children: [
              Text(
                "Kode Produk: ${widget.produk.kodeProduk}",
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                "Nama Produk: ${widget.produk.namaProduk}",
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                "Harga Produk: ${widget.produk.harga}",
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 100, child: _tombolHapusEdit()),
            ],
          ),
        ),
      ),
    );
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
