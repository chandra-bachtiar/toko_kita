// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_kita/bloc/logout_bloc.dart';
import 'package:toko_kita/bloc/produk_bloc.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';
import 'package:toko_kita/ui/produk_detail.dart';

import 'login_page.dart';

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
                onTap: () async {
                  await LogoutBloc.logout().then((value) => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()))
                      });
                },
              )
            ],
          ),
        ),
        body: FutureBuilder<List>(
            future: ProdukBloc.getProduk(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              } else if (snapshot.hasData) {
                return ListProduk(list: snapshot.data);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

class ListProduk extends StatelessWidget {
  final List? list;
  const ListProduk({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemProduk(produk: list![i] as Produk);
      },
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0),
        child: Card(
          child: ListTile(
            title: Text(produk.namaProduk),
            subtitle: Text(formatRupiah(produk.harga)),
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
}
