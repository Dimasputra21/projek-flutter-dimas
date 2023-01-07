import 'package:flutter/material.dart';
import 'package:uas_fp/helper/auth_helper.dart';
import 'package:uas_fp/page/Login.dart';

class HalamanDaftarUtama extends StatelessWidget {
  const HalamanDaftarUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UI halaman Register
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 199, 238),
      body: ListView(padding: const EdgeInsets.all(8.0), children: <Widget>[
        const SizedBox(height: 50.0),
        Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              'DAFTAR',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: ('Quando-Regular')),
            ),
          ),
          const SizedBox(height: 35),
          const Padding(
            padding: EdgeInsets.all(8.0),
            // Fungsi untuk Form Register (Ada di bawah)
            child: Signupform(),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Text("Atau masuk dengan", style: TextStyle()),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                // Tombol (gak penting) logo google, jika ditekan menuju halaman login
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginUtama()));
                  },
                  child: Image.asset(
                    "assets/images/google.png",
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                ),
              )
            ],
          ),
        ]),
      ]),
    );
  }
}

// fungsi atau class untuk Form Register
class Signupform extends StatefulWidget {
  const Signupform({Key? key}) : super(key: key);

  @override
  State<Signupform> createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  // Inisiasi key untuk widget form agar tidak bertumpuk karena beda widget dan sebagai key form secara keseluruhan
  final _formKey = GlobalKey<FormState>();

  // Inisiasi apa saja Form yang akan diisi beserta jenisnya
  String? email;
  String? password;
  String? nama;
  String? username;
  String? telepon;

  // Inisiasi untuk tombol lihat atau matikan password pada password
  bool visibilityPass = false;

  // Inisiasi untuk Password
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // UI Form halaman register
    var space = const SizedBox(height: 10);

    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // TextField nama lengkap
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Masukkan Nama Anda",
                    labelText: "Nama Lengkap",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Colors.black54;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                    prefixIcon: const Icon(Icons.person)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Lengkap Wajib Diisi';
                  }
                  return null;
                },
                onSaved: (val) {
                  nama = val;
                },
                keyboardType: TextInputType.text,
              ),
              space,
              // TextField username
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Masukkan Username Anda",
                    labelText: "Username",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Colors.black54;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                    prefixIcon: const Icon(Icons.person_outline)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username Wajib Diisi';
                  }
                  return null;
                },
                onSaved: (val) {
                  username = val;
                },
                keyboardType: TextInputType.text,
              ),
              space,
              // TextField E-Mail
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Masukkan E-mail Anda",
                    labelText: "E-Mail",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Colors.black54;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                    prefixIcon: const Icon(Icons.email_rounded)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'E-Mail Wajib Diisi';
                  }
                  return null;
                },
                onSaved: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              space,
              // TextField No Telepon
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Masukkan No Telepon Anda",
                    labelText: "No Telepon",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Colors.black54;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                    prefixIcon: const Icon(Icons.person_add_alt_sharp)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No Telepon Wajib Diisi';
                  }
                  return null;
                },
                onSaved: (val) {
                  telepon = val;
                },
                keyboardType: TextInputType.number,
              ),
              space,
              // TextField Password
              TextFormField(
                controller: pass,
                obscureText: !visibilityPass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Masukkan Password Anda",
                  labelText: "Password",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).errorColor
                        : Colors.black54;
                    return TextStyle(color: color, letterSpacing: 1.3);
                  }),
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: GestureDetector(
                    // Fungsi untuk melihat dan mematikan password
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
                    return 'Password Wajib Diisi';
                  } else if (value.length < 6) {
                    return 'Password Terlalu Pendek, Minimal 6 Karakter';
                  }
                  return null;
                },
              ),
              space,
              // TextField konfirmasi password
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Masukkan Konfirmasi Password",
                  labelText: "Konfirmasi Password",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).errorColor
                        : Colors.black54;
                    return TextStyle(color: color, letterSpacing: 1.3);
                  }),
                  prefixIcon: const Icon(Icons.key_rounded),
                  suffixIcon: GestureDetector(
                    // Fungsi untuk melihat dan mematikan password
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
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi Password Wajib Diisi';
                  } else if (value != pass.text) {
                    return 'Password Tidak Sesuai';
                  } else if (value.length < 6) {
                    return 'Password Terlalu Pendek, Minimal 6 Karakter';
                  }
                  return null;
                },
              ),
              space,

              SizedBox(
                  height: 50,
                  width: double.infinity,
                  // Tombol Save SignUp atau Register
                  child: ElevatedButton(
                    onPressed: () {
                      // Respon Button Press
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Menggunakan Method atau Function Register yang dibuat di auth_helper.dart,
                        // dimana jika hasil dari auth bernilai null atau tidak ada kesalahan
                        // maka proses register berhasil dan langsung menuju halaman
                        // Login, sedangkan jika gagal maka akan muncul
                        // notif gagal atau tidak berhasil
                        AuthHelper()
                            .signUp(email: email!, password: password!)
                            .then((result) {
                          if (result == null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginUtama()));
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
                      'DAFTAR',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ]));
  }
}
