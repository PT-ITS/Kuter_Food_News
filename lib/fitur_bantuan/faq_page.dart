import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            
            _buildFAQItem(
              question: 'Apa itu aplikasi ini?',
              answer: 'Aplikasi ini adalah platform yang memungkinkan pengguna untuk...',
              icon: Icons.help_outline,
            ),
            _buildFAQItem(
              question: 'Bagaimana cara menggunakannya?',
              answer: 'Anda dapat menggunakan aplikasi ini dengan mengikuti langkah-langkah berikut...',
              icon: Icons.info_outline,
            ),
            // Tambahkan lebih banyak item FAQ di sini
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
    required IconData icon,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!, width: 1)
      ),    
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        title: Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          answer,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
