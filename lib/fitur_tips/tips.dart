import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips Berguna',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTipCard(
              context,
              Icons.lightbulb_outline,
              'Tip 1: Gunakan Fitur Favorit',
              'Manfaatkan fitur favorit untuk menyimpan item yang sering Anda gunakan agar lebih mudah diakses di kemudian hari.',
            ),
            SizedBox(height: 15),
            _buildTipCard(
              context,
              Icons.access_time,
              'Tip 2: Atur Pengingat',
              'Gunakan fitur pengingat untuk membantu Anda tidak melewatkan tugas penting atau jadwal yang sudah ditetapkan.',
            ),
            SizedBox(height: 15),
            _buildTipCard(
              context,
              Icons.settings,
              'Tip 3: Sesuaikan Pengaturan',
              'Sesuaikan pengaturan aplikasi sesuai kebutuhan Anda untuk meningkatkan pengalaman pengguna dan kenyamanan.',
            ),
            SizedBox(height: 15),
            _buildTipCard(
              context,
              Icons.help_outline,
              'Tip 4: Manfaatkan Bantuan',
              'Jika Anda mengalami kesulitan, jangan ragu untuk menggunakan fitur bantuan atau menghubungi dukungan pelanggan.',
            ),
            // Tambahkan lebih banyak tips di sini
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[300]!, width: 1), // Border abu-abu
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromRGBO(247, 97, 78, 1),
              size: 35,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
