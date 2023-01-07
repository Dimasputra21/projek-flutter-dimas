import 'package:flutter/material.dart';
import 'package:uas_fp/helper/auth_helper.dart';
import 'package:uas_fp/page/Login.dart';

class index4 extends StatefulWidget {
  const index4({Key? key}) : super(key: key);

  @override
  State<index4> createState() => _index4State();
}

class _index4State extends State<index4> {
  @override
  Widget build(BuildContext context) {
    // UI untuk halaman logout(index4)
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 199, 238),
      body: const Center(
        child: Text("Log Out"),
      ),
      floatingActionButton: FloatingActionButton(
        // Menggunakan Method LogOut yang dibuat di auth_helper.dart,
        // dimana jika logOut berhasil akan langsung kembali ke halaman Login
        onPressed: () {
          AuthHelper().signOut().then((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginUtama()),
              ));
        },
        tooltip: 'LogOut',
        child: const Icon(Icons.logout),
      ),
    );
  }
}
