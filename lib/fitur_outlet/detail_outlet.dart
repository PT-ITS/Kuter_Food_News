import 'package:flutter/material.dart';

class DetailOutletPage extends StatelessWidget {
  final String outletName;

  DetailOutletPage({required this.outletName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          outletName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        foregroundColor: Colors.black,
        // elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/150'), // Dummy image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Outlet Name
            Text(
              outletName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Contact Number
            Text(
              'Nomor Telepon: (082) 12345678',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            
            // Address
            Text(
              'Alamat: Jl. Contoh No.123, Sumenep',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // Description
            Text(
              'Deskripsi: Ini adalah outlet dummy dengan data yang digunakan untuk tujuan pengujian. Outlet ini memiliki berbagai produk dan layanan yang tersedia untuk pelanggan.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 40),
            // Action Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Hubungi Outlet', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
