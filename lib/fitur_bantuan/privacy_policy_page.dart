import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider di bawah AppBar
            Divider(
              color: Colors.grey[300], // Warna abu-abu untuk divider
              thickness: 1, // Ketebalan divider            
            ),
            SizedBox(height: 10), // Jarak antara divider dan konten
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 5),
            Text(
              'Kami menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda.',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildPolicySection(
                    title: '1. Pengumpulan Data',
                    content: 'Kami mengumpulkan data pribadi seperti nama dan alamat email...',
                  ),
                  _buildPolicySection(
                    title: '2. Penggunaan Data',
                    content: 'Data yang kami kumpulkan digunakan untuk...',
                  ),
                  _buildPolicySection(
                    title: '3. Perlindungan Data',
                    content: 'Kami mengambil langkah-langkah untuk melindungi data Anda...',
                  ),
                  _buildPolicySection(
                    title: '4. Hak Anda',
                    content: 'Anda memiliki hak untuk mengakses, memperbaiki, atau menghapus data Anda...',
                  ),
                  // Add more privacy policy sections here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection({required String title, required String content}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!, width: 1.51), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
