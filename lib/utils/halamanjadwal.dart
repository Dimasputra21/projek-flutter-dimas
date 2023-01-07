import 'package:flutter/material.dart';
import 'package:uas_fp/page/beranda.dart';
import 'package:uas_fp/utils/buatjadwal.dart';
import 'package:uas_fp/utils/jadwalselesai.dart';

class halamanjadwal extends StatefulWidget {
  const halamanjadwal({Key? key}) : super(key: key);

  @override
  State<halamanjadwal> createState() => _halamanjadwalState();
}

class _halamanjadwalState extends State<halamanjadwal> {
  @override
  Widget build(BuildContext context) {
    // UI untuk halaman jadwal
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Halaman Jadwal "),
        backgroundColor: const Color.fromARGB(255, 89, 107, 207),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 177, 199, 238),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15.0),
            const Text(
              'Jadwal',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: ('Quando-Regular'),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: const EdgeInsets.all(15),
                  // Tombol menuju halaman Jadwal Konsultasi(jadwalselesai.dart)
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const jadwalselesai()));
                    }),
                    splashColor: Colors.blueAccent,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.calendar_month,
                            size: 40,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Jadwal Konsultasi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.calendar_month,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: const EdgeInsets.all(15),
                  // Tombol menuju halaman Buat atau Tambah Jadwal(buatjadwal.dart)
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const buatjadwal()));
                    }),
                    splashColor: Colors.blueAccent,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.add_alarm,
                            size: 40,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Tambah Jadwal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.add_alarm,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        tooltip: 'Kembali',
        child: const Icon(Icons.backspace_rounded),
      ),
    );
  }
}
