import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailSuratKeluarPage extends StatelessWidget {
  const DetailSuratKeluarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text('Detail Surat Keluar'   , 
        
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
      
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget> [
            TextField(
              decoration: InputDecoration(
                hintText: "Asal Surat",
                labelText: "Asal Surat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "Dari",
                labelText: "Dari",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "No. Surat",
                labelText: "No. Surat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "Perihal",
                labelText: "Perihal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "Sifat",
                labelText: "Sifat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "Tanggal Surat",
                labelText: "Tanggal Surat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20.0),),
              TextField(
              decoration: InputDecoration(
                hintText: "Tanggal Diterima",
                labelText: "Tanggal Diterima",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
                ),
              ),

            ]
           )
        )
      );
  }
}
// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class DetailSuratKeluarPage extends StatelessWidget {
//   const DetailSuratKeluarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//         title: Text('Detail Surat Keluar'   , 
        
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.black
//         ),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(MdiIcons.chevronLeft ,)),
//         iconTheme: IconThemeData(color: Colors.black , ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
        
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [Text("Subjek Surat Keluar"  , style: TextStyle(fontSize: 18  , fontWeight: FontWeight.bold),) , 
//                 Container(
//                   width: 100,
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
                  
//                   ),
//                   child: Center(child: Text("kotak masuk")),
//                 )
//                 ],
//               ),
//              ListTile(
//               leading: CircleAvatar(),
//               trailing: Text("2 jam yang lalu"),
//               title: Text("Dari | Pengirim"   , style: TextStyle(
//                 fontSize: 16 , fontWeight: FontWeight.bold  , 
//               ),),
//               subtitle: Text("Deskripsi surat masuk"   , style: TextStyle(
//                 fontSize: 12 , fontWeight: FontWeight.w500  , 
//               ),),
//              ),

//              Container(
//             child: Column(
//               children: [
//                 Text("Deskripsi Surat lore"),

                
//               ],
//             ),
//              )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }