import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DisposisiMasukPage extends StatefulWidget {
  const DisposisiMasukPage({Key? key}) : super(key: key);

  @override
  _DisposisiMasukPageState createState() => _DisposisiMasukPageState();
}

class _DisposisiMasukPageState extends State<DisposisiMasukPage> {
  // Daftar tujuan disposisi yang bisa dipilih
  final List<String> _tujuanDisposisi = [
    'Bagian A',
    'Bagian B',
    'Bagian C',
    'Bagian D',
  ];

  // Variabel untuk menyimpan nilai tujuan yang dipilih
  String _selectedTujuan = 'Bagian A';

  // Controller untuk isian tujuan lainnya
  final TextEditingController _tujuanLainnyaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disposisi Surat Masuk',
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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // Dropdown untuk memilih tujuan disposisi
            DropdownButtonFormField(
              value: _selectedTujuan,
              onChanged: (newValue) {
                setState(() {
                  // Ketika nilai dropdown berubah, update nilai _selectedTujuan
                  _selectedTujuan = newValue.toString();
                });
              },
              items: [
                ..._tujuanDisposisi.map((tujuan) {
                  return DropdownMenuItem(
                    value: tujuan,
                    child: Text(tujuan),
                  );
                }),
                DropdownMenuItem(
                  value: 'Lainnya',
                  child: Text('Lainnya'),
                ),
              ],
              decoration: InputDecoration(
                labelText: "Ditujukan Pada",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            // Tampilkan TextField untuk isian tujuan lainnya
            if (_selectedTujuan == 'Lainnya')
              TextField(
                controller: _tujuanLainnyaController,
                onChanged: (newValue) {
                  // Tidak perlu mengubah _selectedTujuan
                },
                decoration: InputDecoration(
                  hintText: "Masukkan tujuan lainnya",
                  labelText: "Tujuan Lainnya",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Isi Disposisi",
                labelText: "Isi Disposisi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika atau tindakan yang ingin dilakukan saat tombol "Kirim" ditekan.
                // Misalnya, simpan disposisi ke server atau tampilkan pesan sukses.
                // Contoh:
                // Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya.
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(100, 50),
                ), // Mengatur ukuran button
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue,
                ), // Mengatur warna background button
              ),
              child: const Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}