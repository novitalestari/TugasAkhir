// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:sisuka/login_screen.dart';
// import 'package:sisuka/profile_page.dart';
// import 'package:sisuka/surat_masuk.dart';

// class DashboardScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'   ,
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.black
//         ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         padding: EdgeInsets.all(16.0),
//         shrinkWrap: true,
//         children: [
//           buildMenuItem(
//             icon: MdiIcons.email,
//             title: 'Surat Masuk',
//             onTap: () {
//               // Aksi ketika menu "Surat Masuk" di-tap
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return SuratMasukPage();
//               },));
//             },
//           ),
//           buildMenuItem(
//             icon: MdiIcons.emailArrowLeftOutline,
//             title: 'Surat Keluar',
//             onTap: () {
//               // Aksi ketika menu "Surat Keluar" di-tap
//             },
//           ),
//           buildMenuItem(
//             icon:MdiIcons.account,
//             title: 'Profile',
//             onTap: () {
//               // Aksi ketika menu "Profile" di-tap
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return ProfilePage();
//               },));
//             },
//           ),
//           buildMenuItem(
//             icon: MdiIcons.logout,
//             title: 'Logout',
//             onTap: () {
//               // Aksi ketika menu "Logout" di-tap
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//                 return LoginApp();
//               },));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         borderOnForeground: true,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon),
//             SizedBox(height: 10),
//             Text(title ,
//               style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold   , ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sisuka/login_screen.dart';
import 'package:sisuka/profile_page.dart';
import 'package:sisuka/surat_keluar.dart';
import 'package:sisuka/surat_masuk.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    HomeWidget(),
    SuratFolderWidget(),
    ProfileWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.folder),
            label: 'Folder Surat',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}

class SuratFolderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Folder Surat'),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile'),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SuratMasukPage();
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
                  return SuratKeluarPage();
                },
              ));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.account,
            title: 'Profile',
            onTap: () {
              // Aksi ketika menu "Profile" di-tap pada apa
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProfilePage();
                },
              ));
            },
          ),
          buildMenuItem(
            icon: MdiIcons.logout,
            title: 'Logout',
            onTap: () {
              // Aksi ketika menu "Logout" di-tap
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return LoginApp();
                },
              ));
            },
          ),
        ],
      ),
    );
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
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
