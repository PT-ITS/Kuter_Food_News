import 'package:flutter/material.dart';
import 'faq_page.dart'; // Import halaman FAQ
import 'contact_support_page.dart'; // Import halaman Kontak Dukungan
import 'user_guide_page.dart'; // Import halaman Panduan Pengguna
import 'privacy_policy_page.dart'; // Import halaman Kebijakan Privasi

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan & Dukungan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildHelpSection(
              context,
              title: 'FAQ',
              description: 'Temukan jawaban untuk pertanyaan umum di sini.',
              icon: Icons.question_answer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              },
            ),
            _buildHelpSection(
              context,
              title: 'Kontak Dukungan',
              description: 'Hubungi tim dukungan kami untuk bantuan lebih lanjut.',
              icon: Icons.contact_support,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactSupportPage()),
                );
              },
            ),
            _buildHelpSection(
              context,
              title: 'Panduan Pengguna',
              description: 'Lihat panduan dan tutorial tentang cara menggunakan aplikasi.',
              icon: Icons.library_books,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserGuidePage()),
                );
              },
            ),
            _buildHelpSection(
              context,
              title: 'Kebijakan Privasi',
              description: 'Baca kebijakan privasi kami untuk mengetahui bagaimana data Anda digunakan.',
              icon: Icons.privacy_tip,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      color: Colors.transparent, // Remove background color
      elevation: 0, // Remove shadow
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
        onTap: onTap,
      ),
    );
  }
}
