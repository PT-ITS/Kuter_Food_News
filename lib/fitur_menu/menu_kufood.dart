// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/fitur_menu/menu.dart';

class MenuKufoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu KuFood',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Judul di AppBar
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Tombol kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan shadow di bawah AppBar
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15), // Padding untuk konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider di bawah AppBar
            Divider(
              color: Colors.grey[300], // Warna abu-abu untuk divider
              thickness: 1, // Ketebalan divider           
            ),
            SizedBox(height: 10), // Jarak antara divider dan konten

            // Konten Menu KuFood           
            Expanded(
              child: ListView(
                children: [
                  // Item Menu KuFood
                  Container(
               
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icon/menu.png', // Ganti dengan path ke gambar aset Anda
                        width: 60, // Lebar gambar
                        height: 60, // Tinggi gambar
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Menu di KuFood',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5), // Jarak antara title dan subtitle
                          Text(
                            'Kelola menu dan kategori dagangan anda di KuFood dari sini.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                      onTap: () {
                        // Tambahkan aksi ketika item diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuPage(),
                          ),
                        );
                      },
                    ),
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
