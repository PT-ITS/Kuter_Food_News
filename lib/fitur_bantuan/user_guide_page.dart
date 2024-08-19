import 'package:flutter/material.dart';

class UserGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Pengguna', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
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
              'Panduan Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 5),
            Text(
              'Berikut adalah panduan untuk menggunakan aplikasi kami:',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildGuideStep(
                    icon: Icons.login,
                    title: 'Login',
                    description: 'Masukkan email dan password Anda untuk login.',
                  ),
                  _buildGuideStep(
                    icon: Icons.navigation,
                    title: 'Navigasi',
                    description: 'Gunakan menu di bagian bawah untuk berpindah antara halaman.',
                  ),
                  _buildGuideStep(
                    icon: Icons.settings,
                    title: 'Pengaturan',
                    description: 'Sesuaikan pengaturan aplikasi sesuai kebutuhan Anda.',
                  ),
                  _buildGuideStep(
                    icon: Icons.help_outline,
                    title: 'Bantuan',
                    description: 'Akses halaman bantuan untuk mendapatkan dukungan tambahan.',
                  ),
                  // Add more guide steps here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideStep({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[300]!, width: 1)
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(247, 97, 78, 0.1),
          child: Icon(icon, color: Color.fromRGBO(247, 97, 78, 1), size: 30),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description, style: TextStyle(fontSize: 16, color: Colors.black54)),
      ),
    );
  }
}
