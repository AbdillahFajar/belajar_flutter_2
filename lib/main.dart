import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bikin Splash Screen Sederhana",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), //Bikin kombinasi warna dengan salah satu warnanya adalah amber agar bisa dipakai untuk semua material widget
        scaffoldBackgroundColor: Colors.amberAccent, //Atur warna latar belakang untuk semua scaffold
      ),
      home: const SplashScreen(),
    );
  }
}

//Widget Splash Screen dengan animasi fade in (muncul perlahan) menggunakan StatefulWidget, karena akan menggunakan setState(), untuk merubah UI aplikasi
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; //Bikin nilai opacity awal dengan nilai 0 supaya saat diawal running, logonya gak muncul

  @override
  void initState() {
    super.initState(); //inisialisasi keadaan awal

    //Bikin animasi fade in dengan durasi munculnya 200 milidetik, setelah itu, ubah state (keadaan) bikin nilai opacity jadi 1.0 supaya logonya kelihatan
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigasi ke halaman lain setelah 3 detik splash screen-nya muncul
    // Timer(const Duration(seconds: 3), () {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_) => const SignInScreen()),
    //     );
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; //ambil color scheme dari materialApp

    return Scaffold(
      body: Center( //Taruh child dari body, tepat di tengah layar
        child: AnimatedOpacity( //Bikin animasi berdasarkan opacity (transparansi) logo
          opacity: _opacity, //panggil variable _opacity yang telah dibuat di atas
          duration: const Duration(seconds: 1), //durasi perubahan dari opacity logo 0.0 ke 1.0 selama 1 detik
          curve: Curves.easeInOut, //mengatur percepatan dan perlambatan animasi (curve) dengan gerakan pelan di awal, cepat di pertengahan dan kembali pelan lagi di akhir (easeInOut)
          child: Column(
            mainAxisSize: MainAxisSize.min, //atur besar column agar hanya sebesar isi di dalamnya
            mainAxisAlignment: MainAxisAlignment.center, //atur letak isi column agar tepat di tengah layar
            children: [
              Container( //kotak serbaguna untuk bikin box decoration tempat foto atau logonya berada
                margin: const EdgeInsets.all(24), //pake margin atau jarak luar container sebanyak 24 pixel untuk semua sisi (atas, bawah, kiri, kanan)
                height: 250, //
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/NasDuk.png'), //foto logonya yang folder assets sudah didaftarkan di pubspec.yaml
                    fit: BoxFit.contain, //sesuaikan gambarnya dengan box-nya agar terlihat utuh tanpa terpotong sedikitpun
                  ),
                ),
              ),
              const SizedBox(height: 15), //bikin spasi antara widget di atas dan di bawahnya
              Text(
                'Memuat Data...',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 15),
              CircularProgressIndicator(color: colorScheme.primary), //bikin loading muter-muter
            ],
          ),
        ),
      ),
    );
  }
}

// class SignInScreen extends StatelessWidget {
//   const SignInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amberAccent,
//       body: const Center(
//         child: Text(
//           "Ini Halaman Sign In",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
