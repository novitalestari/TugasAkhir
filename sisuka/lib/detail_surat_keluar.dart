import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sisuka/api.dart';
import 'dart:convert';
import 'package:sisuka/disposisi_keluar.dart';

class DetailSuratKeluarPage extends StatefulWidget {
  DetailSuratKeluarPage({super.key, this.idSurat});
  String? idSurat;

  @override
  State<DetailSuratKeluarPage> createState() => _DetailSuratKeluarPageState();
}

class _DetailSuratKeluarPageState extends State<DetailSuratKeluarPage> {
  String? id;
  String? no_surat;
  String? perihal;
  String? id_jenis_surat;
  String? kategori;
  String? tgl_surat;
  String? opd_sumber_surat;
  String? id_opd;
  String? id_struktur_opd;
  String? disposisi;
  String? tracking;
  String? file_surat;

  // final TextEditingController _id = TextEditingController();
  final TextEditingController _noSurat = TextEditingController();
  final TextEditingController _perihal = TextEditingController();
  // final TextEditingController _idJenisSurat = TextEditingController();
  // final TextEditingController _kategori = TextEditingController();
  // final TextEditingController _tglSurat = TextEditingController();
  // final TextEditingController _opdSumberSurat = TextEditingController();
  // final TextEditingController _idopd = TextEditingController();
  // final TextEditingController _idStrukturOpd = TextEditingController();
  // final TextEditingController _disposisi = TextEditingController();
  // final TextEditingController _tracking = TextEditingController();
  // final TextEditingController _fileSurat = TextEditingController();


  bool showTindakLanjutColumn = false;
  final TextEditingController _tindakLanjutController = TextEditingController();
  String isiTindakLanjut = ''; // Variable to store the content of tindak lanjut
  bool isTindakLanjutSubmitted = false; // Flag to check if tindak lanjut is submitted

  Future<void> fetchData() async {
    final url = Uri.parse('${Api.baseUrl}/surat');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body)["data"][0];
      // _id.text = data["id"];
      _noSurat.text = data["no_surat"];
      _perihal.text = data["perihal"];
      // _idJenisSurat.text = data["id_jenis_surat"];
      // _Kategori.text = data["kategori"];
      // _tglSurat.text = data["tgl_surat"];
      // _opdSumberSurat.text = data["opd_sumber_surat"];
      // _idopd.text = data["id_opd"];
      // _idStrukturOpd.text = data["id_struktur_opd"];
      // _Disposisi.text = data["disposisi"];
      // _tracking.text = data["tracking"];
      // _fileSurat.text = data["fileSurat"].toString();



    } else {
      print('Gagal mengambil data. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Ukuran tombol Tindak Lanjut dan Disposisi
    final double buttonWidth = 100;
    final double buttonHeight = 50;

    Column tindakLanjutColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Isi Tindak Lanjut :",
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _tindakLanjutController,
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showTindakLanjutColumn = false;
              isiTindakLanjut = _tindakLanjutController.text; // Save the content of tindak lanjut
              isTindakLanjutSubmitted = true; // Mark tindak lanjut as submitted
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(100, 50),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue,
            ),
          ),
          child: const Center(child: Text('Kirim')),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Surat Keluar',
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
          child: const Icon(
            MdiIcons.chevronLeft,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'No. Surat :',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  controller: _noSurat,
                  decoration: InputDecoration(
                    hintText: "No. Surat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),

                const Text(
                  'Perihal :',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  controller: _perihal,
                  decoration: InputDecoration(
                    hintText: "Perihal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                
                const Text(
                  'Jenis Surat:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _idJenisSurat,
                  decoration: InputDecoration(
                    hintText: "Jenis Surat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const Text(
                  'Kategori:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _kategori,
                  decoration: InputDecoration(
                    hintText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                  const Text(
                  'Tanggal Surat:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _idtglSurat,
                  decoration: InputDecoration(
                    hintText: "Tanggal Surat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

              const Text(
                  'OPD Sumber Surat:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _opdSumberSurat,
                  decoration: InputDecoration(
                    hintText: "OPD Sumber Surat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const Text(
                  'id OPD:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _idOpd,
                  decoration: InputDecoration(
                    hintText: "id OPD",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const Text(
                  'id Struktur OPD:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _idStrukturOpd,
                  decoration: InputDecoration(
                    hintText: "id Sruktur OPD",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const Text(
                  'File Surat:',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextField(
                  readOnly: true,
                  // controller: _fileSurat,
                  decoration: InputDecoration(
                    hintText: "File Surat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Tindak Lanjut Surat",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Tampilkan isi tindak lanjut jika sudah dikirim sebelumnya
                isiTindakLanjut.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            title: Text(
                              'Tampilkan Tindak Lanjut',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            children: [
                              Text(
                                isiTindakLanjut,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : SizedBox(),
                // Tampilkan kolom tindak lanjut jika belum dikirim dan belum ada tindak lanjut sebelumnya
                showTindakLanjutColumn && !isTindakLanjutSubmitted
                    ? tindakLanjutColumn
                    : SizedBox(),
                
                // Tombol Tindak Lanjut dan Disposisi berada di samping-sampingan
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Nonaktifkan tombol Tindak Lanjut jika tindak lanjut sudah dikirim
                    isTindakLanjutSubmitted
                        ? Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                'Tindak Lanjut',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                showTindakLanjutColumn = true;
                              });
                            },
                            child: Container(
                              width: buttonWidth,
                              height: buttonHeight,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Tindak Lanjut',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisposisiKeluarPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.shade700,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Disposisi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
