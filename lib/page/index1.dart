import 'package:flutter/material.dart';

class index1 extends StatefulWidget {
  const index1({Key? key}) : super(key: key);

  @override
  State<index1> createState() => _index1State();
}

class _index1State extends State<index1> {
  @override
  Widget build(BuildContext context) {
    // UI halaman hubungi dokter atau index1.dart(Statis atau UI saja)
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 199, 238),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const Text(
                "HUBUNGI DOKTER",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: ('Quando-Regular'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
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
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: Image.asset(
                            "assets/images/maria.png",
                            width: 55,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Dr Maria Selena Sp.JP",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Dokter Spesialis Jantung dan Paru-Paru")
                        ],
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(7),
                              child: Image.asset(
                                "assets/images/telepon.jpg",
                                width: 30,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(7),
                              child: Image.asset(
                                "assets/images/email.png",
                                width: 30,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(7),
                              child: Image.asset(
                                "assets/images/info.jpg",
                                width: 35,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                /////batas
              ),
            ],
          ),
        ));
  }
}
