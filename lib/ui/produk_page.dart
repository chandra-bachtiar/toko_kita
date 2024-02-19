// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';
import 'package:toko_kita/ui/produk_detail.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Produk"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdukForm(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Logout"),
              trailing: const Icon(Icons.logout),
              onTap: () async {},
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          ItemProduk(
            produk: Produk(
                kodeProduk: "P001",
                namaProduk: "Laptop",
                harga: 10000000,
                id: 1),
          ),
          ItemProduk(
            produk: Produk(
                kodeProduk: "P002",
                namaProduk: "Printer",
                harga: 2000000,
                id: 2),
          ),
          ItemProduk(
            produk: Produk(
                kodeProduk: "P003",
                namaProduk: "Monitor",
                harga: 3000000,
                id: 3),
          ),
          ItemProduk(
            produk: Produk(
                kodeProduk: "P004", namaProduk: "Mouse", harga: 500000, id: 4),
          ),
          ItemProduk(
            produk: Produk(
                kodeProduk: "P005",
                namaProduk: "Keyboard",
                harga: 400000,
                id: 5),
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(produk: produk),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk),
          subtitle: Text(produk.harga.toString()),
        ),
      ),
    );
  }
}
