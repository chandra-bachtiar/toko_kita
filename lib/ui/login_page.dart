import 'package:flutter/material.dart';
import 'package:toko_kita/bloc/login_bloc.dart';
import 'package:toko_kita/helpers/user_info.dart';
import 'package:toko_kita/ui/produk_page.dart';
import 'package:toko_kita/ui/registrasi_page.dart';
import 'package:toko_kita/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _emailTextField(),
                  _passwordTextField(),
                  _buttonLogin(),
                  const SizedBox(
                    height: 30,
                  ),
                  _menuRegistrasi(),
                ],
              ),
            ),
          ),
        ));
  }

  //membuat textbox email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email tidak boleh kosong';
        }
        return null;
      },
    );
  }

  //membuat textbox password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  //membuat button login
  Widget _buttonLogin() {
    return ElevatedButton(
      child: const Text('Login'),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate && !_isLoading) {
          _submit();
        }
      },
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    LoginBloc.login(
            email: _emailTextboxController.text,
            password: _passwordTextboxController.text)
        .then((value) async {
      print(value);
      await UserInfo().setToken(value.token.toString());
      await UserInfo().setUserId(value.userId);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ProdukPage()));
    }, onError: (error) {
      print(error);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const WarningDialog(
          description: 'Login Gagal, Email atau password salah',
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text('Registrasi', style: TextStyle(color: Colors.blue)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrasiPage()),
          );
        },
      ),
    );
  }
}
