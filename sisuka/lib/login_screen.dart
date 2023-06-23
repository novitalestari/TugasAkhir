import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sisuka/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

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

  Future<bool?> _login() async {
    // TODO: Lakukan proses autentikasi atau validasi login di sini
    final url = Uri.parse('http://192.168.43.4:8000/api/auth/login');

    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response =
            await http.post(url, body: {'email': email, 'password': password});

        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          SpUtil.putBool('isLoggedIn', true);
          SpUtil.putInt('userId', data['data']['id']);
          SpUtil.putString('token', data['token']);
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print('Log in failed. Status code: ${e}');
      }
      // Jika login berhasil, simpan status login dan beralih ke halaman dashboard
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
            onPressed: () {
              _login().then((value) {
                if (value!) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Login Gagal'),
                        content: Text(
                            'Email atau password salah. Silakan coba lagi.'),
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
              });
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
