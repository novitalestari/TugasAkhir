import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      
        title: Text('Profile'   , 
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        ),
               leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(MdiIcons.chevronLeft ,)),
        iconTheme: IconThemeData(color: Colors.black , ),
        centerTitle: true,
        backgroundColor: Colors.white,
        
      ),
      body: SafeArea(
        
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                ListTile(
                  title: Text("Pengaturan Akun"),
                  trailing: Icon(MdiIcons.chevronRight),
                ),
                ListTile(
                  title: Text("Pengaturan Akun"),
                  trailing: Icon(MdiIcons.chevronRight),
                ),
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
