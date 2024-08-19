import 'package:flutter/material.dart';

class UlasanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ulasan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // Contoh ulasan pertama
            _buildReviewCard(
              context,
              'assets/avatar1.png', // Ganti dengan path gambar avatar
              'John Doe',
              4.5,
              'Ulasan ini sangat membantu! Tempatnya nyaman dan makanannya lezat.',
            ),
            SizedBox(height: 10),
            // Contoh ulasan kedua
            _buildReviewCard(
              context,
              'assets/avatar2.png', // Ganti dengan path gambar avatar
              'Jane Smith',
              3.0,
              'Pelayanan bisa ditingkatkan. Makanan baik tapi sedikit dingin.',
            ),
            SizedBox(height: 10),
            // Tambah lebih banyak ulasan di sini
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(
    BuildContext context,
    String avatarPath,
    String reviewerName,
    double rating,
    String reviewText,
  ) {
    return Card(
      color: Colors.transparent,
      elevation: 0, // Background color of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[300]!, width: 1), // Gray border
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarPath),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewerName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    reviewText,
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
