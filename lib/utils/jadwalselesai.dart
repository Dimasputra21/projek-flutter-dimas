import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_fp/utils/halamanjadwal.dart';
import 'package:uas_fp/utils/editjadwal.dart';

class jadwalselesai extends StatefulWidget {
  const jadwalselesai({Key? key}) : super(key: key);

  @override
  State<jadwalselesai> createState() => _jadwalselesaiState();
}

class _jadwalselesaiState extends State<jadwalselesai> {
  final Color _backgroundcolor = const Color.fromARGB(255, 177, 199, 238);

  @override
  Widget build(BuildContext context) {
    // UI untuk halaman Jadwal Konsultasi
    return Scaffold(
      backgroundColor: _backgroundcolor,
      appBar: AppBar(
        title: const Text(" Jadwal Konsultasi "),
        backgroundColor: const Color.fromARGB(255, 89, 107, 207),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: const Text(
                ' Jadwal Konsultasi ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Quando-Regular',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Fungsi streambuilder digunakan untuk melakukan read data setelah nilai pada controller create data
            // telah diisi value atau nilai
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  // Melakukan read data jadwal pada collection dengan nama "jadwal4" di firebase
                  .collection("jadwal4")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // Jika Berhasil maka melakukan pemanggilan fungsi atau method read data(dibawah)
                return jadwalfinish(
                  jadwalKonsultasi: snapshot.data.docs,
                );
              },
            )
          ],
        ),
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
}

// membuat class yang akan digunakan untuk melakukan read data
class jadwalfinish extends StatelessWidget {
  // Inisiasi untuk melakukan list nantinya
  final List<DocumentSnapshot> jadwalKonsultasi; 

  jadwalfinish({required this.jadwalKonsultasi});

  // Inisiasi untuk isi dari trailing
  late String menuPilihan;
  static const menuItems = <String>["Edit", "Hapus"];

  final List<PopupMenuItem<String>> _popupMenuItems = menuItems
      .map((String val) => PopupMenuItem<String>(
            value: val,
            child: Text(val),
          ))
      .toList();

  // Method unuk Delete atau Hapus Data
  void hapusData(index) {
    FirebaseFirestore.instance.runTransaction((Transaction tr) async {
      DocumentSnapshot snapshot = await tr.get(index);
      await tr.delete(snapshot.reference);
    });

  // Jika data berhasil dihapus maka pada terminal VSC akan print "data berhasil dihapus"
    print("Data berhasil dihapus");
  }

  @override
  Widget build(BuildContext context) {
    // Bagian untuk melakukan read data
    return ListView.builder(
      shrinkWrap: true,
      // bagian yang akan terbaca akan menyesuaikan dengan jumlah data yang telah dicreate dan tercreate di firebase
      itemCount: jadwalKonsultasi.length,
      // menggunakan "jadwalKonsultasi" yang telah diinisiasi sebelumnya untuk menghubungkan controller pada menu
      // create data dengan value data yang sudah ada di firebase
      itemBuilder: (context, i) {
        String namaDokter = jadwalKonsultasi[i]["Nama_Dokter"].toString();
        String spesialisDokter =
            jadwalKonsultasi[i]["Spesialis_Dokter"].toString();
        String tanggalPertemuan =
            jadwalKonsultasi[i]["Tanggal_Pertemuan"].toString();
        String waktuPertemuan =
            jadwalKonsultasi[i]["Waktu_Pertemuan"].toString();

        // UI tampilan data yang berhasil diread
        return ListTile(
          leading: Image.asset(
            "assets/images/maria.png",
          ),
          title: Row(
            children: <Widget>[
              Text(
                "                     $namaDokter ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: ('Quando-Regular'),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: <Widget>[
              Text(
                " Spesialis ; $spesialisDokter ",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 2.0,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 15),
                  Text(
                    "Tanggal : $tanggalPertemuan",
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "Waktu : $waktuPertemuan",
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),

          // UI atau tampilan untuk trailing
          trailing: PopupMenuButton<String>(
            onSelected: (String newVal) {
              menuPilihan = newVal;

              // If else untuk menampilkan menu edit atau menu hapus 
              if (menuPilihan == "Edit") {
                // Jika memilih menu edit maka akan diarahkan ke halaman edit jadwal, dan akan mendeteksi value
                // yang telah dicreate sebelumnya
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => editjadwal(
                          index: jadwalKonsultasi[i].reference,
                          namaDokter: namaDokter,
                          spesialisDokter: spesialisDokter,
                          tanggalPertemuan: tanggalPertemuan,
                          waktuPertemuan: waktuPertemuan,
                        )));
              } else {
                // Jika memilih selain menu edit atau memilih menu hapus data, maka akan menjalankan fungsi
                // atau method hapusData yang telah dibuat sebelumnya
               hapusData(jadwalKonsultasi[i].reference);
              }
            },
            itemBuilder: (context) => _popupMenuItems,
          ),
        );
      },
    );
  }
}
