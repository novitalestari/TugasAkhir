import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'package:sisuka/api.dart';
import 'dart:convert';
import 'package:sisuka/detail_surat_keluar.dart';

class SuratKeluarPage extends StatefulWidget {
  const SuratKeluarPage({Key? key}) : super(key: key);

  @override
  _SuratKeluarPageState createState() => _SuratKeluarPageState();
}

class _SuratKeluarPageState extends State<SuratKeluarPage> {
  late List<dynamic> suratKeluarList;
  List<dynamic> filteredSuratKeluarList = [];
  int _selectedSuratIndex = -1; // Inisialisasi dengan nilai -1 sebagai tanda tidak ada surat yang dipilih

  Future<List<dynamic>> fetchData() async {
    final url = Uri.parse('${Api.baseUrl}/surat');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> mailList = data['data'];
      for (var mail in mailList) {
        mail['isRead'] = false; // Tambahkan field 'isRead' untuk menandai surat belum dibaca
        mail['status'] = 'Diterima'; // Tambahkan field 'status' untuk menyimpan status surat, default 'Diterima'
      }
      return mailList;
    } else {
      print('Gagal mengambil data. Status code: ${response.statusCode}');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        suratKeluarList = data;
        filteredSuratKeluarList = suratKeluarList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Surat Keluar',
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
          child: const Icon(MdiIcons.chevronLeft),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar Surat Keluar",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Kolom Pencarian
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  onChanged: (keyword) {
                    if (keyword.isEmpty) {
                      setState(() {
                        // Jika keyword kosong, tampilkan semua surat
                        filteredSuratKeluarList = suratKeluarList;
                      });
                    } else {
                      // Jika keyword tidak kosong, lakukan pencarian
                      final List<dynamic> tempList = [];
                      for (var surat in suratKeluarList) {
                        if (surat['perihal']
                                .toLowerCase()
                                .contains(keyword.toLowerCase()) ||
                            surat['no_surat']
                                .toLowerCase()
                                .contains(keyword.toLowerCase())) {
                          tempList.add(surat);
                        }
                      }
                      setState(() {
                        filteredSuratKeluarList = tempList;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari Surat',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),

              // Tampilkan daftar surat yang sudah disaring
              Expanded(
                child: ListView.separated(
                  itemCount: filteredSuratKeluarList.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey, // Anda dapat mengubah warna garis sesuai keinginan
                    thickness: 1.0,     // Anda dapat mengubah ketebalan garis sesuai keinginan
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredSuratKeluarList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // Perbarui _selectedSuratIndex dengan indeks surat yang sedang dipilih
                          _selectedSuratIndex = index;
                          // Set 'isRead' flag to true when a mail is tapped
                          filteredSuratKeluarList[index]['isRead'] = true;

                          // Ganti status menjadi 'Dibaca' saat surat dibuka
                          if (filteredSuratKeluarList[index]['status'] == 'Diterima') {
                            filteredSuratKeluarList[index]['status'] = 'Dibaca';
                          }
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailSuratKeluarPage(
                              idSurat: item['id'].toString(),
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/surat-keluar.png'),
                          radius: 20,
                          backgroundColor: Colors.white,
                        ),
                        title: Text(
                          "${item['perihal']}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: item['isRead'] ? Colors.black : Colors.blue,
                          ),
                        ),
                        subtitle: Text(
                          "${item['no_surat']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: item['isRead'] ? Colors.black : Colors.blue,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 4), // Spasi antara ikon dan teks keterangan
                            Text(
                              _getStatusText(item['status']),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: _getColorForStatus(item['status']),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorForStatus(String status) {
    switch (status) {
      case 'Diterima':
        return Colors.blue;
      case 'Dibaca':
        return Colors.green;
      case 'Ditindaklanjuti':
        return Colors.orange;
      case 'Didisposisi':
        return Colors.red; 
      default:
        return Colors.blue;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'Diterima':
        return 'Diterima';
      case 'Dibaca':
        return 'Dibaca';
      case 'Ditindaklanjuti':
        return 'Ditindaklanjuti';
      case 'Didisposisi':
        return 'Didisposisi';
      default:
        return 'Diterima';
    }
  }
}
