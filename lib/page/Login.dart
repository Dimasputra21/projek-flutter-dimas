import 'package:flutter/material.dart';
import 'package:uas_fp/helper/auth_helper.dart';
import 'package:uas_fp/page/beranda.dart';
import 'package:uas_fp/page/register.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Halaman Login',
    home: LoginUtama(),
  ));
}

class LoginUtama extends StatelessWidget {
  const LoginUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UI halaman Login
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 199, 238),
        body: Container(
          padding: const EdgeInsets.all(25.0),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  ' LOGIN ',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Quando-Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),

                // Fungsi untuk Form Login (Ada di bawah)
                child: LoginForm(),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    child: const Text(
                      "Belum punya akun ?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Quando'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 1),
                    // Tombol menuju Halaman Register atau Daftar
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HalamanDaftarUtama()));
                      },
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

// fungsi atau class untuk Form Login
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Inisiasi untuk widget form agar tidak bertumpuk karena beda widget
  final _formKey = GlobalKey<FormState>();

  // Inisiasi apa saja Form yang akan diisi beserta jenisnya
  String? email;
  String? password;

  // Inisiasi untuk tombol lihat atau matikan password pada TextField password
  bool visibilityPass = false;

  @override
  Widget build(BuildContext context) {
    // UI Form halaman Login
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // TextField Username
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                      borderRadius: BorderRadius.circular(7)),
                  labelText: 'Email atau Username',
                  hintText: 'Input Username atau Email Anda',
                  prefixIcon: const Icon(Icons.person),
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).errorColor
                        : Colors.black38;
                    return TextStyle(color: color, letterSpacing: 1.3);
                  }),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan Email Anda, Tidak Boleh Kosong!!!';
                  }
                  return null;
                },
                onSaved: (val) {
                  email = val;
                },
              ),

              const SizedBox(
                height: 20,
              ),

              // TextField Password
              TextFormField(
                // initialValue: 'Input Text'
                obscureText: !visibilityPass,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(204, 255, 229, 1.0),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                      borderRadius: BorderRadius.circular(7)),
                  labelText: 'Password',
                  hintText: 'Input Password Anda',
                  prefixIcon: const Icon(Icons.key_rounded),
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).errorColor
                        : Colors.black38;
                    return TextStyle(color: color, letterSpacing: 1.3);
                  }),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      visibilityPass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onTap: () {
                      setState(() {
                        visibilityPass = !visibilityPass;
                      });
                    },
                  ),
                ),
                onSaved: (val) {
                  password = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan Password Anda, Tidak Boleh Kosong!!!';
                  } else if (value.length < 6) {
                    return 'Minimal Password 6 Karakter';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 30,
              ),

              SizedBox(
                  height: 54,
                  width: double.infinity,
                  // Tombol Login menuju Halaman Beranda(index2)
                  child: ElevatedButton(
                    onPressed: () {
                      // Respon Button Press
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Menggunakan Method Login yang dibuat di auth_helper.dart,
                        // dimana jika hasil dari auth bernilai null atau tidak ada kesalahan maka proses
                        // Login akan berhasil dan langsung menuju halaman Beranda(index2.dart), sedangkan 
                        // jika gagal maka akan muncul notif gagal atau tidak berhasil
                        AuthHelper()
                            .signIn(email: email!, password: password!)
                            .then((result) {
                          if (result == null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ]));
  }
}
