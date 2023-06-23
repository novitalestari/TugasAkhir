import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sisuka/detail_surat_masuk.dart';

class SuratMasukPage extends StatefulWidget {
  const SuratMasukPage({Key? key}) : super(key: key);

  @override
  _SuratMasukPageState createState() => _SuratMasukPageState();
}

class _SuratMasukPageState extends State<SuratMasukPage> {
  // Tambahkan fungsi fetchData untuk mengambil data dari URL API
  Future<void> fetchData() async {
    final url = Uri.parse('http://192.168.43.4:8000/api/surat');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Lakukan sesuatu dengan data yang diterima
      return data;
    } else {
      print('Gagal mengambil data. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Panggil fungsi fetchData saat halaman dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Surat Masuk',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
            )),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
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
            Text(
              "Daftar Surat Masuk",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data['data'][index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailSuratMasukPage(),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 192, 3),
                            ),
                            title: Text(
                              "${item['perihal']}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${item['no_surat']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          );
                          // return Container();
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
