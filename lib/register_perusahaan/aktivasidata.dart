// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/register.dart';
import 'package:kuterfood/register_perusahaan/verifikasidata.dart';
import 'package:kuterfood/register_pribadi/pendaftaran_data.dart';
import 'package:kuterfood/register_pribadi/verifikasi_data.dart';

class AktivasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 97, 78, 1),  // Background color of AppBar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white), // Exit button
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RegistrationPage(), // Navigate to RegistrationPage
              ),
            );
          },
        ),
        title: Text(
          'Daftar KuFood',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Orange Container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 97, 78, 1), 
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30), // Radius for the bottom-left corner
                  bottomRight: Radius.circular(30), // Radius for the bottom-right corner
                ),
              ),
              height: 230, // Height to accommodate the description shape
              child: Stack(
                children: [
                  // Original content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icon/ad3.png', // Replace with your icon path                         
                          width: 80, // Width of the icon
                          height: 80, // Height of the icon
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aktivasi Layanan KuFood',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Jika semua data usahanya sudah. layanan KuFood yang anda pilih akan mulai kami aktifkan.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // White Shape with Icon and Text
                  Positioned(
                    bottom: 106, // Position at the bottom of the orange container
                    left: 110,
                    right: 110,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time, // Clock icon
                            color: Color.fromRGBO(247, 97, 78, 1), 
                            size: 20, // Icon size
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Proses sekitar 1-7 hari kerja',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(247, 97, 78, 1), 
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 145, // Adjust this value to position the white container correctly
            left: 16,
            right: 16,
            bottom: 380, // Leave space for the button at the bottom
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berikut data & dokumen yang perlu anda siapkan:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Requirements
                  _buildRequirement(
                    'assets/icon/camera.png',
                    'Foto profil restoran',
                    'Untuk ditampilkan di aplikasi, berupa makanan yang dijual.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/clock.png',
                    'Jam operasional',
                    'Min. 4 hari seminggu dan 3 jam per hari.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/menu.png',
                    'Daftar menu',
                    'Min. 3 jenis kategori menu.',
                    30.0,
                  ),
                ],
              ),
            ),
          ),
          // Buttons at the Bottom
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            VerifikasiPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const offsetBegin =
                              Offset(-1.0, 0.0); // Start position
                          const offsetEnd = Offset.zero; // End position
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: offsetBegin, end: offsetEnd)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          // Define your custom duration
                          final duration = Duration(milliseconds: 150);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(
                            milliseconds: 150), // Duration of the transition
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromRGBO(247, 97, 78, 1), 
                      width: 2,
                    ),
                    minimumSize:
                        Size(190, 50), // Width and height of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sebelumnya',
                    style: TextStyle(
                      color: Color.fromRGBO(247, 97, 78, 1), 
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showStepsBottomSheet(context); // Show the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromRGBO(247, 97, 78, 1),  // Button color
                    minimumSize:
                        Size(190, 50), // Width and height of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                    ),
                  ),
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for displaying requirements (Optional)
  Widget _buildRequirement(
    String iconPath, String text, String description, double iconSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath, // Path to your icon asset
            width: iconSize, // Width of the icon
            height: iconSize, // Height of the icon
            fit: BoxFit.contain,
          ),
          SizedBox(width: 16), // Space between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2), // Space between title and description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the bottom sheet
  void _showStepsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              // Title
              Text(
                'Tiga Langkah Daftarkan Usaha Anda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Steps
              _buildStep(
                'assets/icon/ad1.png',
                'Pendaftaran Data Usaha',
                'Mengisi data usaha dengan informasi yang benar dan lengkap.',
                'Data usaha yang anda kirim akan kami periksa untuk memastikan semuanya sudah lengkap dan sesuai.',
              ),
              _buildStep(
                'assets/icon/ad2.png',
                'Verifikasi Data',
                'Kami akan melakukan verifikasi terhadap data yang anda kirimkan.',
                'Proses verifikasi memerlukan waktu sekitar 1-3 hari kerja.',
              ),
              _buildStep(
                'assets/icon/ad3.png',
                'Aktivasi Layanan KuFood',
                'Setelah data diverifikasi, layanan KuFood akan diaktifkan.',
                'Kami akan menghubungi Anda untuk menyelesaikan proses aktivasi.',
              ),
              SizedBox(height: 16),
              // Daftar Sekarang Button
              ElevatedButton(
                onPressed: () {
                  // Handle registration here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(247, 97, 78, 1),  // Button color
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Daftar Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget for displaying each step
  Widget _buildStep(
  String iconPath,
  String title,
  String subtitle,
  String description,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconPath, // Path to your icon asset
          width: 50, // Width of the icon
          height: 50, // Height of the icon
          fit: BoxFit.contain,
        ),
        SizedBox(width: 16), // Space between icon and text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2), // Space between title and subtitle
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4), // Space between subtitle and description
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
