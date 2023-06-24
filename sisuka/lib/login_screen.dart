import 'package:flutter/material.dart';
import 'package:sisuka/dashboard_screen.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // TODO: Lakukan proses autentikasi atau validasi login di sini
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Jika login berhasil, simpan status login dan beralih ke halaman dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Jika login gagal, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau password salah. Silakan coba lagi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
        body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset(
            'assets/images/logo.png', // Ganti dengan path/logo gambar Anda
            width: 100, // Sesuaikan lebar logo sesuai kebutuhan
            height: 100, // Sesuaikan tinggi logo sesuai kebutuhan
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}