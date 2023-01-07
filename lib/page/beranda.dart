import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:uas_fp/page/Index0.dart';
import 'package:uas_fp/page/Index1.dart';
import 'package:uas_fp/page/Index2.dart';
import 'package:uas_fp/page/index4.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Inisiasi untuk menunjukkan masuk ke halaman ke berapa secara default (masuk ke halaman ke 3 atau index2.dart)
  int currentIndex = 2;

  // Inisiasi list Widget yang ada di halaman beranda (mulai dari halaman 1 sampai halaman 4)
  // dan akan ditaruh di navbar bawah
  List<Widget> widgets = [
    const index0(),
    const index1(),
    const index2(),
    const Center(child: Text('Index 3')),
    const index4(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // UI halaman Beranda (secara umum) khususnya bagian navbar
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 199, 238),
        // fungsi untuk otomatis masuk ke halaman ke3 aau index2.dart
        body: widgets[currentIndex],
        // UI bottom NavBar
        bottomNavigationBar: ConvexAppBar( 
            height: 50,
            backgroundColor: Color.fromARGB(255, 207, 199, 89),
            items: const [
              TabItem(
                icon: Icons.person_outline_sharp,
                title: 'Pengguna',
              ),
              TabItem(icon: Icons.message, title: 'Pesan'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.shopping_cart_sharp, title: 'Shop'),
              TabItem(icon: Icons.menu, title: 'Menu'),
            ],
            initialActiveIndex: 2,
            onTap: (int i) => setState(() {
                  currentIndex = i;
                })),
      ),
    );
  }
}
