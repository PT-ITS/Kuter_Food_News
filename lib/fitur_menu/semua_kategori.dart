import 'package:flutter/material.dart';
import 'package:kuterfood/fitur_menu/LalapanDetailPage.dart';
import 'package:kuterfood/fitur_menu/MakananDetailPage.dart';
import 'package:kuterfood/fitur_menu/MinumanDetailPage.dart';
import 'package:kuterfood/fitur_menu/tambah_kategori.dart';

class SemuaKategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Kategori Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  // Daftar kategori menu
                  _buildKategoriTile(context, 'Minuman', Icons.local_cafe, 5, MinumanDetailPage()),
                  _buildKategoriTile(context, 'Makanan', Icons.fastfood_rounded, 10, MakananDetailPage()),
                  _buildKategoriTile(context, 'Lalapan', Icons.emoji_food_beverage, 3, LalapanDetailPage()),
                  // Tambahkan lebih banyak kategori sesuai kebutuhan
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TambahKategoriPage(),
                    ),
                  );
                },
                child: Text('Tambah Kategori Menu', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKategoriTile(BuildContext context, String kategori, IconData icon, int jumlahMenu, Widget detailPage) {
    return ListTile(
      leading: Icon(icon, size: 40),
      title: Text(kategori, style: TextStyle(fontSize: 18)),
      subtitle: Text('Detail tentang $kategori'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$jumlahMenu   ', style: TextStyle(fontSize: 14, color: Colors.black54)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailPage,
          ),
        );
      },
    );
  }
}
