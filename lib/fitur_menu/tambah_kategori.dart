import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TambahKategoriPage extends StatefulWidget {
  @override
  _TambahKategoriPageState createState() => _TambahKategoriPageState();
}

class _TambahKategoriPageState extends State<TambahKategoriPage> {
  void _handleSave() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set dialog background to white
          title: Column(
            children: [
              Lottie.asset('assets/icon/Animation - 1723709348973.json', width: 100, height: 100), // Animation asset
              SizedBox(height: 10),
              Text('Berhasil', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Text('Kategori menu telah berhasil ditambahkan.'),
          actions: [
            Center(
              child: Container(
                width: 150, // Set the width of the button
                child: TextButton(
                  child: Text('OK'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // Text color
                    backgroundColor: Color.fromRGBO(247, 97, 78, 1), // Background color of the button
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius of the button
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Navigate back to the previous page
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Kategori Menu',
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
            SizedBox(height: 20),
            Text(
              'Nama Kategori:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan nama kategori',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi Kategori:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan deskripsi kategori',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSave,
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
