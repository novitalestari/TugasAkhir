import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sisuka/disposisi_keluar.dart';

class DetailSuratMasukPage extends StatelessWidget {
  const DetailSuratMasukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Surat Masuk',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              MdiIcons.chevronLeft,
            )),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Surat',
                maxLines: 1,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Surat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              const Text(
                'Dari :',
                maxLines: 1,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Dari",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "No. Surat",
                    labelText: "No. Surat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Perihal",
                    labelText: "Perihal",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Sifat",
                    labelText: "Sifat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Tanggal Surat",
                    labelText: "Tanggal Surat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Tanggal Diterima",
                    labelText: "Tanggal Diterima",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
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
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(100, 50)), // Mengatur ukuran button
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Mengatur warna background button
                ),
                child: const Center(child: Text('Kirim')),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  DisposisiKeluarPage();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(200, 50)), // Mengatur ukuran button
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey), // Mengatur warna background button
                ),
                child: const Center(child: Text('Disposisi')),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
