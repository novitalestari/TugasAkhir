import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DisposisiKeluarPage extends StatelessWidget {
  const DisposisiKeluarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Disposisi Keluar'   , 
        
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
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget> [
            new TextField(
              decoration: new InputDecoration(
                hintText: "Ditujukan Pada",
                labelText: "Ditujukan Pada",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0)
                )
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 20.0),),
              new TextField(
              maxLines: 5,
              decoration: new InputDecoration(
                hintText: "Isi Disposisi",
                labelText: "Isi Disposisi",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0)
                )
                ),
              ),
            ]
           )
        )
    );
  }
}