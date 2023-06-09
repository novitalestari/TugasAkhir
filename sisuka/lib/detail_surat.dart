import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailSuratPage extends StatelessWidget {
  const DetailSuratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Detail Surat'   , 
        
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
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Subjek Surat Masuk"  , style: TextStyle(fontSize: 18  , fontWeight: FontWeight.bold),) , 
                Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  
                  ),
                  child: Center(child: Text("kotak masuk")),
                )
                ],
              ),
             ListTile(
              leading: CircleAvatar(),
              trailing: Text("2 jam yang lalu"),
              title: Text("Dari | Pengirim"   , style: TextStyle(
                fontSize: 16 , fontWeight: FontWeight.bold  , 
              ),),
              subtitle: Text("Deskripsi surat masuk"   , style: TextStyle(
                fontSize: 12 , fontWeight: FontWeight.w500  , 
              ),),
             ),

             Container(
            child: Column(
              children: [
                Text("Deskripsi Surat lore"),

                
              ],
            ),
             )
            ],
          ),
        )
      ),
    );
  }
}