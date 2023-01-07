import 'package:flutter/material.dart';
import 'package:uas_fp/utils/halamanjadwal.dart';
import 'package:uas_fp/utils/caridokter2.dart';

class index2 extends StatefulWidget {
  const index2({Key? key}) : super(key: key);

  @override
  State<index2> createState() => _indexState();
}

class _indexState extends State<index2> {
  @override
  Widget build(BuildContext context) {
    // UI untuk halaman utama beranda (index2.dart)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 107, 207),
        centerTitle: true,
        title: const Text(" BERANDA "),
      ),
      backgroundColor: const Color.fromARGB(255, 177, 199, 238),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.airport_shuttle_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Darurat',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            // Tombol menuju halaman Cari Dokter
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const caridokter2()));
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.supervised_user_circle,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Cari Dokter',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            // Tombol menuju halaman jadwal
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const halamanjadwal()));
              },
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.event_note,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Buat Jadwal',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.maps_home_work_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Rumah Sakit Terdekat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.medication_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Apotik dan Obat',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.live_help,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Kenali Gejalanya',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
