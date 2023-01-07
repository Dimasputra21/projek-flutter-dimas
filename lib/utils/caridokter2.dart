
import 'package:uas_fp/utils/buatjadwal.dart';
import 'package:flutter/material.dart';
import 'package:uas_fp/page/index2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class caridokter2 extends StatefulWidget {
  const caridokter2({Key? key}) : super(key: key);

  @override
  State<caridokter2> createState() => _caridokter2State();
}

Color _backgroundcolor = const Color.fromARGB(255, 177, 199, 238);

class _caridokter2State extends State<caridokter2> {
  // DateTime selectedDate = DateTime.now();

  // Future<Null> _selectedDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2022, 11),
  //       lastDate: DateTime(2050));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Cari Dokter ",),
        backgroundColor: const Color.fromARGB(255, 89, 107, 207),
        centerTitle: true,
      ),
      backgroundColor: _backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              "CARI DOKTER",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: ('Quando-Regular'),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Cari Dokter",
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.blueAccent,
                  fillColor: Colors.white54,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/maria.png",
                              width: 60,
                            ),
                            // width: MediaQuery.of(context).size.width,
                          ),
                          Column(
                            children: const <Widget>[
                              Text(
                                "Dr. Strange",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "Dokter Spesialis Jantung dan Paru-Paru",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 7.0),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const buatjadwal()));
                              },
                              child: const Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      // color: Colors.white,
                      // height: 20,
                      // width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/maria.png",
                              width: 60,
                            ),
                            // width: MediaQuery.of(context).size.width,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget> [
                              Text(
                                "Dr. Strange",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "Dokter Spesialis Jantung dan Paru-Paru",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 7.0),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                               Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const buatjadwal()));
                              },
                              child: const Icon(Icons.add),
                            ),
                            // Icon(
                            //   Icons.add,
                            //   color: Colors.blueGrey,
                            // ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const index2()));
        },
        tooltip: 'Kembali',
        child: const Icon(Icons.backspace_rounded),
      ),
    );
  }
}



