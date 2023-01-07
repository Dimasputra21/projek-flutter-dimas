import 'package:flutter/material.dart';

class index0 extends StatefulWidget {
  const index0({Key? key}) : super(key: key);

  @override
  State<index0> createState() => _index1State();
}

class _index1State extends State<index0> {
  @override
  Widget build(BuildContext context) {
    // UI untuk index0 atau halaman profil pada beranda(Statis)
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 199, 238),
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/maria.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: const Text(
                    "Maria",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: ('Quando-Regular')),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, right: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 30,
                            child: const Icon(
                              Icons.home,
                            ),
                          ),
                          const Text(
                            "Jalan Pegangsaan Timur Jakarta no.23",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: ('Quando-Regular'),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 30,
                            child: const Icon(
                              Icons.accessibility_rounded,
                            ),
                          ),
                          const Text(
                            "Berat = 50Kg",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: ('Quando-Regular'),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 30,
                            child: const Icon(
                              Icons.settings_accessibility,
                            ),
                          ),
                          const Text(
                            "Tinggi = 170 Cm",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: ('Quando-Regular'),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: 500,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: const Icon(Icons.email),
                                  ),
                                  const Text(
                                    "mariavania@gmail.com",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ('Quando-Regular'),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: const Icon(Icons.phone),
                                  ),
                                  const Text(
                                    "086754352512",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ('Quando-Regular'),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
