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
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk),
          subtitle: Text(produk.harga.toString()),
        ),
      ),
    );
  }
}
