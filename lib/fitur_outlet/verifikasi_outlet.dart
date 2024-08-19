import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';  // Import the Lottie package
import 'package:kuterfood/beranda.dart'; // Import your BerandaPage

class VerifikasiOutletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/icon/Animation - 1723091577552.json', // Path to your Lottie file
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
            Text(
              'Proses Verifikasi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi proses verifikasi akan ditampilkan di sini.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BerandaPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust the radius
                ),
              ),
              child: Text('Kembali',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
