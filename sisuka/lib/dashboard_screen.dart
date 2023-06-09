import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sisuka/login_screen.dart';
import 'package:sisuka/profile_page.dart';
import 'package:sisuka/surat_masuk.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'   , 
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: [
          buildMenuItem(
            icon: MdiIcons.email,
            title: 'Surat Masuk',
            onTap: () {
              // Aksi ketika menu "Surat Masuk" di-tap
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SuratMasukPage();
              },));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.emailArrowLeftOutline,
            title: 'Surat Keluar',
            onTap: () {
              // Aksi ketika menu "Surat Keluar" di-tap
            },
          ),
          buildMenuItem(
            icon:MdiIcons.account,
            title: 'Profile',
            onTap: () {
              // Aksi ketika menu "Profile" di-tap
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage();
              },));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.logout,
            title: 'Logout',
            onTap: () {
              // Aksi ketika menu "Logout" di-tap
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return LoginApp();
              },));
            },
          ),
        ],
      ),
    );
  }
  
  Widget buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(height: 10),
            Text(title , 
              style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold   , ),
            ),
          ],
        ),
      ),
    );
  }
}