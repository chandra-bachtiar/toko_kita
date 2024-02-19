import 'package:flutter/material.dart';
import 'package:toko_kita/ui/registrasi_page.dart';
import 'package:toko_kita/ui/login_page.dart';
import 'package:toko_kita/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const RegistrasiPage(),
      // home: const LoginPage(),
      home: const ProdukPage(),
    );
  }
}
