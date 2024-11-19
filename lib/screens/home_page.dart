import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import 'form_page.dart'; // Pastikan file form_page.dart dibuat dan diimpor

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dengan Gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Widget dengan card dan shadow
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8.0, // Efek shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: HeaderWidget(), // Reusable widget untuk header
                ),
              ),
              const SizedBox(height: 20),

              // Menampilkan gambar logo dengan border dan radius
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://siakad.itts.ac.id/mahasiswa/resource/doc/images/icon/logo-login.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Deskripsi dengan gaya teks yang lebih menarik
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Selamat datang di platform Ujian Online ITTS. "
                  "Silakan lengkapi data Anda sebelum memulai ujian.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Mulai Ujian dengan desain modern
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormPage()),
                    );
                  },
                  child: const Text("Mulai Ujian"), // Tombol dengan teks yang jelas
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
