// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PusatBantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1), // AppBar color
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text(
          'Pusat Bantuan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Cabang Baru',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Berikut adalah langkah-langkah untuk menambahkan cabang baru:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            _buildStep(
              '1. Persiapkan Dokumen',
              'Siapkan semua dokumen yang diperlukan untuk pendaftaran cabang baru.',
            ),
            _buildStep(
              '2. Masuk ke Akun',
              'Login ke akun Anda melalui aplikasi atau website.',
            ),
            _buildStep(
              '3. Pilih Menu Tambah Cabang',
              'Di dashboard, pilih opsi "Tambah Cabang" untuk memulai proses.',
            ),
            _buildStep(
              '4. Isi Formulir',
              'Isi formulir yang tersedia dengan informasi cabang baru Anda.',
            ),
            _buildStep(
              '5. Verifikasi dan Kirim',
              'Verifikasi data yang Anda masukkan dan kirim untuk proses lebih lanjut.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle, // Check circle icon
            color: Color.fromRGBO(247, 97, 78, 1), // Icon color
            size: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
