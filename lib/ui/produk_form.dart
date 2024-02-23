import 'package:flutter/material.dart';
import 'package:toko_kita/bloc/produk_bloc.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_page.dart';
import 'package:toko_kita/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukForm extends StatefulWidget {
  Produk? produk;
  ProdukForm({super.key, this.produk});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String tombolSubmit = "Tambah";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    // ignore: unnecessary_null_comparison
    if (widget.produk != null) {
      setState(() {
        judul = "Ubah Produk";
        tombolSubmit = "Ubah";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk;
        _namaProdukTextboxController.text = widget.produk!.namaProduk;
        _hargaProdukTextboxController.text = widget.produk!.harga.toString();
      });
    } else {
      setState(() {
        judul = "Tambah Produk";
        tombolSubmit = "Tambah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Kode Produk tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nama Produk tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga Produk"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Harga Produk tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return ElevatedButton(
      child: Text(tombolSubmit),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) {
            if (widget.produk != null) {
              _update();
            } else {
              _submit();
            }
          }
        }
      },
    );
  }

  _submit() {
    setState(() {
      _isLoading = true;
    });

    Produk createProduk =
        Produk(id: 1, harga: 0, kodeProduk: '', namaProduk: '');
    createProduk.kodeProduk = _kodeProdukTextboxController.text;
    createProduk.namaProduk = _namaProdukTextboxController.text;
    createProduk.harga = int.parse(_hargaProdukTextboxController.text);

    ProdukBloc.addProduk(produk: createProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              const WarningDialog(description: "Gagal menambahkan produk"));
    });
    setState(() {
      _isLoading = false;
    });
  }

  _update() {
    setState(() {
      _isLoading = true;
    });

    Produk updateProduk =
        Produk(id: 1, harga: 0, kodeProduk: '', namaProduk: '');
    updateProduk.id = widget.produk!.id;
    updateProduk.kodeProduk = _kodeProdukTextboxController.text;
    updateProduk.namaProduk = _namaProdukTextboxController.text;
    updateProduk.harga = int.parse(_hargaProdukTextboxController.text);

    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              const WarningDialog(description: "Gagal mengubah produk"));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
