import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      
        title: const Text('Profile'   , 
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
              leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(MdiIcons.chevronLeft ,)),
        iconTheme: const IconThemeData(color: Colors.white , ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        
      ),
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(height: 15,),
                Text("Ahmad" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                Text("1020120102" , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w500),),
                ListTile(
                  title: Text("Pengaturan Akun"),
                  trailing: Icon(MdiIcons.chevronRight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
