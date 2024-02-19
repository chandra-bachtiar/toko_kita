import 'package:flutter/material.dart';
import 'package:toko_kita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // bool _isLoading = false;

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
        // var validate = _formKey.currentState!.validate();
      },
    );
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
