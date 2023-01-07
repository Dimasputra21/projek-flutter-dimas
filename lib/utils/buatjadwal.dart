import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_fp/utils/halamanjadwal.dart';
import 'package:uas_fp/utils/jadwalselesai.dart';

class buatjadwal extends StatefulWidget {
  const buatjadwal({Key? key}) : super(key: key);

  @override
  State<buatjadwal> createState() => _buatjadwalState();
}

class _buatjadwalState extends State<buatjadwal> {
  // Inisiasi controller untuk form yang akan dibuat
  TextEditingController _namaDokter = TextEditingController();
  TextEditingController _spesialisDokter = TextEditingController();
  TextEditingController _tanggalPertemuan = TextEditingController();
  TextEditingController _waktuPertemuan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UI untuk halaman Buat Jadwal
      appBar: AppBar(
        title: const Text(" Halaman Create Jadwal "),
        backgroundColor: const Color.fromARGB(255, 89, 107, 207),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 177, 199, 238),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          const SizedBox(height: 30.0),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: const Text(
                  "Tambah Jadwal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: ('Quando-Regular')),
                ),
              ),
              const SizedBox(height: 20.0),
              // Form Buat Jadwal
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // TextField Nama Dokter
                      TextFormField(
                        controller: _namaDokter,
                        decoration: InputDecoration(
                          labelText: "Nama Dokter",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // TextField Spesialis Dokter
                      TextFormField(
                        controller: _spesialisDokter,
                        decoration: InputDecoration(
                          labelText: "Spesialis Dokter",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // TextField Form Tanggal
                      TextFormField(
                        controller: _tanggalPertemuan,
                        decoration: InputDecoration(
                          labelText: "Tanggal (DD-MM-YYYY)",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // TextField Form Waktu
                      TextFormField(
                        controller: _waktuPertemuan,
                        decoration: InputDecoration(
                          labelText: "Waktu (Jam:Menit)",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    // Tombol untuk melakukan simpan jadwal yang dibuat, jika berhasil maka akan diarahkan ke
                    // halaman jadwal konsultasi (jadwalselesai)
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      // Respon Button press, dimana memasukkan fungsi dari method yang sudah dibuat(dibawah)
                      onPressed: () {
                        final addJadwal = Jadwal(
                          namaDokter: _namaDokter.text,
                          spesialisDokter: _spesialisDokter.text,
                          tanggalPertemuan: _tanggalPertemuan.text,
                          waktuPertemuan: _waktuPertemuan.text,
                        );
                        // jika create data gagal maka pada VSC akan print "gagal membuat jadwal baru"
                        createJadwal(addJadwal).then((docJadwal) {
                          Navigator.pop(context);
                        }).catchError(
                            (error) => print("Gagal membuat Jadwal baru"));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const jadwalselesai()));
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const halamanjadwal()));
        },
        tooltip: 'Kembali',
        child: const Icon(Icons.backspace_rounded),
      ),
    );
  }

  // Method untuk Tambah atau Create data
  Future createJadwal(Jadwal addJadwal) async {
    final docJadwal =
        // Melakukan create jadwal pada collection dengan nama "jadwal4" di firebase
        FirebaseFirestore.instance.collection("jadwal4").doc();
    addJadwal.id = docJadwal.id;

    final json = addJadwal.toJson();
    await docJadwal.set(json);
  }
}

// Inisiasi Class atau Fungsi Untuk Method Tambah Data
class Jadwal {
  // Inisiasi data yang akan dimasukkan dan tipe datanya(Karena mau simple jadi string semua saja)
  String id;
  final String namaDokter;
  final String spesialisDokter;
  final String tanggalPertemuan;
  final String waktuPertemuan;

  
  Jadwal({
    this.id = '',
    required this.namaDokter,
    required this.spesialisDokter,
    required this.tanggalPertemuan,
    required this.waktuPertemuan,
  });

  // Karena Firebase hanya bisa detect Json maka diubah ke Json
  Map<String, dynamic> toJson() => {
        'id': id,
        'Nama_Dokter': namaDokter,
        'Spesialis_Dokter': spesialisDokter,
        'Tanggal_Pertemuan': tanggalPertemuan,
        'Waktu_Pertemuan': waktuPertemuan,
      };
}
