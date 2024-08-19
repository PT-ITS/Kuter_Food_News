// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/onboarding.dart';
import 'package:kuterfood/register_perusahaan/pendaftarandata.dart';
import 'package:kuterfood/register_pribadi/pendaftaran_data.dart';
import 'package:kuterfood/tambah_outlet/pusat_bantuan.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
    // Menampilkan modal bottom sheet saat halaman dimuat
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showInfoModal(context);
    });
  }

  void _showInfoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Penting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Sebelum melanjutkan, Pilih jenis pendaftaran yang sesuai dengan kebutuhan Anda.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(247, 97, 78, 1), // Warna tombol oranye
                      padding:
                          EdgeInsets.symmetric(vertical: 16), // Jarak vertical
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Radius sudut tombol
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24), // Jarak horizontal teks
                      child: Text(
                        'Saya Mengerti',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            Text(
              'Pilih Jenis Pendaftaran',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            // Daftar Card
            Expanded(
              child: ListView(
                children: [
                  // Card 1: Usaha Milik Pribadi
                  Card(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    elevation: 0, // Menghilangkan shadow
                    child: Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.02), // Jarak border
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Color.fromRGBO(247, 97, 78, 1),
                          size: 40,
                        ),
                        title: Text(
                          'Usaha Milik Pribadi',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Daftarkan usaha milik pribadi Anda dengan mudah.',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                        onTap: () {
                          // Tambahkan aksi ketika Card diklik
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PendaftaranDataPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Card 2: Usaha Milik Perusahaan
                  Card(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    elevation: 0, // Menghilangkan shadow
                    child: Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.02), // Jarak border
                      child: ListTile(
                        leading: Icon(
                          Icons.business,
                          color: Color.fromRGBO(247, 97, 78, 1),
                          size: 40,
                        ),
                        title: Text(
                          'Usaha Milik Perusahaan',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Daftarkan usaha milik perusahaan Anda dan kelola outlet baru.',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                        onTap: () {
                          // Tambahkan aksi ketika Card diklik
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PendaftaranPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Card 3: Tambah Outlet Baru
                  Card(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    elevation: 0, // Menghilangkan shadow
                    child: Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.02), // Jarak border
                      child: ListTile(
                        leading: Icon(
                          Icons.store,
                          color: Color.fromRGBO(247, 97, 78, 1),
                          size: 40,
                        ),
                        title: Text(
                          'Tambah Outlet Baru',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Tambahkan outlet baru untuk usaha Anda.',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                        onTap: () {
                          // Tambahkan aksi ketika Card diklik
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PusatBantuanPage(),
                            ),
                          );
                        },
                      ),
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
