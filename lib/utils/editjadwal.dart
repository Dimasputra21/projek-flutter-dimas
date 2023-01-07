import 'package:flutter/material.dart';
import 'package:uas_fp/utils/jadwalselesai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Membuat class untuk method atau fungsi edit jadwal
class editjadwal extends StatefulWidget {
  // inisiasi untuk form data yang akan diedit sekaligus dengan tipe datanya, termasuk index
  final index;
  final String namaDokter,
      spesialisDokter,
      tanggalPertemuan,
      waktuPertemuan;

  const editjadwal(
      {Key? key,
      this.index,
      required this.namaDokter,
      required this.spesialisDokter,
      required this.tanggalPertemuan,
      required this.waktuPertemuan,
      })
      : super(key: key);

  @override
  State<editjadwal> createState() => _editjadwalState();
}

class _editjadwalState extends State<editjadwal> {
  // sama seperti pada create data, inisiasi controller untuk form
  TextEditingController _namaDokter = TextEditingController();
  TextEditingController _spesialisDokter = TextEditingController();
  TextEditingController _tanggalPertemuan = TextEditingController();
  TextEditingController _waktuPertemuan = TextEditingController();

  // Method untuk proses membawa value yang sudah dibuat pada create data pada halaman edit data
  void setValueForm() {
    _namaDokter.text = widget.namaDokter;
    _spesialisDokter.text = widget.spesialisDokter;
    _tanggalPertemuan.text = widget.tanggalPertemuan;
    _waktuPertemuan.text = widget.waktuPertemuan;
  }

  // Method untuk edit atau update data
  void prosesEdit() {
    FirebaseFirestore.instance.runTransaction((Transaction tr) async {
      DocumentSnapshot snapshot = await tr.get(widget.index);
      tr.update(snapshot.reference, {
        "Nama_Dokter": _namaDokter.text,
        "Spesialis_Dokter": _spesialisDokter.text,
        "Tanggal_Pertemuan": _tanggalPertemuan.text,
        "Waktu_Pertemuan": _waktuPertemuan.text,
      });
    });

    // Jika data berhasil di update pada terminal VSC akan muncul notifikasi, sekaligus akan diarahkan ke halaman
    // Jadwal Konsultasi(jadwalselesai.dart)
    print("Data Berhasil Diupdate");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const jadwalselesai()));
  }

  // Method lanjutan untuk membawa value data dari firebase
  @override
  void initState() {
    setValueForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UI halaman edit jadwal
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Halaman Edit Jadwal "),
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
                  "Edit Jadwal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: ('Quando-Regular')),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // TextField Form Nama Dokter
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
                      // TextField Form Spesialis Dokter
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
                          labelText: "tanggal",
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
              // Tombol untuk menyimpan hasil dari data yang telah diedit menggunakan method edit data(diatas)
              // dimana jika berhasil akan diarahkan kembali ke halaman Jadwal Konsultasi(jadwalselesai.dart)
              OutlinedButton(
                  onPressed: () => prosesEdit(), child: const Text("Simpan")),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
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
              MaterialPageRoute(builder: (context) => const jadwalselesai()));
        },
        tooltip: 'Kembali',
        child: const Icon(Icons.backspace_rounded),
      ),
    );
  }
}
