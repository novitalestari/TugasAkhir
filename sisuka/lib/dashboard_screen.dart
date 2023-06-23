import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sisuka/login_screen.dart';
import 'package:sisuka/profile_page.dart';
import 'package:sisuka/surat_masuk.dart';
import 'package:sisuka/surat_keluar.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: [
          buildMenuItem(
            icon: MdiIcons.email,
            title: 'Surat Masuk',
            onTap: () {
              // Aksi ketika menu "Surat Masuk" di-tap
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SuratMasukPage();
                },
              ));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.emailArrowLeftOutline,
            title: 'Surat Keluar',
            onTap: () {
              // Aksi ketika menu "Surat Keluar" di-tap
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SuratKeluarPage();
                },
              ));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.account,
            title: 'Profile',
            onTap: () {
              // Aksi ketika menu "Profile" di-tap
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ProfilePage();
                },
              ));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.logout,
            title: 'Logout',
            onTap: () {
              // Aksi ketika menu "Logout" di-tap
              _logout().then((value) {
                if (value!) {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginApp();
                    },
                  ));
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Future<bool?> _logout() async {
    final url = Uri.parse('http://192.168.43.4:8000/api/auth/logout166');

    try {
      final response = await http.post(url, body: {}, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!
      });

      if (response.statusCode == 200) {
        SpUtil.clear();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Log in failed. Status code: ${e}');
    }
  }

  Widget buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
