import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailSuratMasukPage extends StatelessWidget {
  const DetailSuratMasukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text('Detail Surat Masuk', 
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
          child: const Icon(MdiIcons.chevronLeft ,)),
        iconTheme: const IconThemeData(color: Colors.black , ),
        centerTitle: true,
        backgroundColor: Colors.white,
        
      ),
      
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget> [
            new TextField(
              decoration: new InputDecoration(
                hintText: "Surat",
                labelText: "Asal",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "Dari",
                labelText: "Dari",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "No. Surat",
                labelText: "No. Surat",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "Perihal",
                labelText: "Perihal",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "Sifat",
                labelText: "Sifat",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "Tanggal Surat",
                labelText: "Tanggal Surat",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 10.0),),
              new TextField(
              decoration: new InputDecoration(
                hintText: "Tanggal Diterima",
                labelText: "Tanggal Diterima",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(1)
                )
                ),
              ),

            ]
           ),
        ),
      );
  }
}