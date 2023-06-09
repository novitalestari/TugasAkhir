import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sisuka/detail_surat.dart';

class SuratMasukPage extends StatelessWidget {
  const SuratMasukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      
        title: Text('Surat Masuk'   , 
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
              Text("Daftar Surat Masuk" , style: TextStyle(
                fontSize: 14 , fontWeight: FontWeight.bold,

              ),),
              Expanded(child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailSuratPage(),));
                  },
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 192, 3),
                  ),
                  title: Text("Title Surat $index" , style: TextStyle(fontSize: 12 , fontWeight:FontWeight.bold),),
                  subtitle: Text("Deskripsi Surat" , style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 12 ),),
                );
              },))
            ],
          ),
        )
      ),
    );
  }


}