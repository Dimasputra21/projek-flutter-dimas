
import 'package:flutter/material.dart';
import 'package:uas_fp/page/Login.dart';
import 'package:uas_fp/page/register.dart';

void main() {
  runApp(const Myfirst());
}

class Myfirst extends StatelessWidget {
  const Myfirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS MOBILE COMPUTING',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'UAS MOBILE COMPUTING'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // UI halaman pertama
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 199, 238),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: const Text(
                      "TANYA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Quando-Regular'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 1),
                    child: const Text(
                      "DOKTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Quando-Regular'),
                    ),
                  ),
                ],
              ),
              Container(
                height: 280,
                width: 170,
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/dokter.png',
                ),
              ),
              Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(top: 20),
                // Tombol untuk Halaman Masuk menuju ke halaman Login
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: const BorderSide(
                                color: Color(0x002196f3),
                              )))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginUtama()));
                  },
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: const Text(
                      "Belum punya akun ?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'Quando'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 1),
                    child: TextButton(
                      // Tombol Daftar disini
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HalamanDaftarUtama()));
                      },
                      // Tombol menuju halaman daftar
                      child: const Text(
                        "Daftar Disini",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
