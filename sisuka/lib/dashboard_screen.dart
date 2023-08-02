import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sisuka/api.dart';
import 'package:sisuka/login_screen.dart';
import 'package:sisuka/profile_page.dart';
import 'package:sisuka/surat_masuk.dart';
import 'package:sisuka/surat_keluar.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
 
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SISUKA',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigo[100],
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/sisuka.png',
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            'Kerjasama Pengabdian Masyarakat',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[900],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'POLITEKNIK NEGERI INDRAMAYU',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[900],
                              ),
                                textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/polindra.png',
                    width: 75,
                    height: 75,
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildMenuItem(
                    icon: MdiIcons.email,
                    title: 'Surat Masuk',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuratMasukPage(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildMenuItem(
                    icon: MdiIcons.emailArrowLeftOutline,
                    title: 'Surat Keluar',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuratKeluarPage(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildMenuItem(
                    icon: MdiIcons.account,
                    title: 'Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildMenuItem(
                    icon: MdiIcons.logout,
                    title: 'Logout',
                    onTap: () {
                      _logout().then((value) {
                        if (value!) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginApp(),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _logout() async {
    final url = Uri.parse('${Api.baseUrl}/auth/logout');

    try {
      final response = await http.post(url, body: {}, headers: {
        HttpHeaders.authorizationHeader: SpUtil.getString('token')!,
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
    return null;
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue, // Warna sorotan saat di-klik (biru)
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}