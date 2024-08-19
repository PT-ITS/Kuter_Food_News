import 'package:flutter/material.dart';
import 'package:kuterfood/beranda.dart';

class HpLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [           
            // Teks Selamat datang
            Text(
              'Selamat datang di KuFood',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Deskripsi
            Text(
              'Masukkan nomor HP Anda untuk melanjutkan.',
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Input Nomor HP
            Text(
              'Nomor HP',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icon/indonesia.png', // Ganti dengan path ke bendera Indonesia
                    width: 30,
                    height: 20,
                  ),
                ),
                hintText: 'Masukkan nomor HP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Tombol Lanjut
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman berikutnya
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BerandaPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const Color.fromRGBO(247, 97, 78, 1),
                ),
                child: Text(
                  'Lanjut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
