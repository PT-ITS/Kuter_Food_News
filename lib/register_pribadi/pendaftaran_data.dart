// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/register.dart';
import 'package:kuterfood/register_pribadi/verifikasi_data.dart';

class PendaftaranDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(247, 97, 78, 1),  // Background color of AppBar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white), // Exit button
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RegistrationPage(), // Navigate to RegistrationPage
              ),
            ); // Close the page
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
                  bottomLeft:
                      Radius.circular(30), // Radius for the bottom-left corner
                  bottomRight:
                      Radius.circular(30), // Radius for the bottom-right corner
                ),
              ),
              height: 230, // Height of the orange container
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                          'assets/icon/ad1.png', // Replace with your icon path                         
                          width: 80, // Width of the icon
                          height: 80, // Height of the icon
                        ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pendaftaran Data Usaha',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lengkapi data berikut untuk melanjutkan pendaftaran data usaha Anda.',
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
            ),
          ),
          // Floating White Container
          Positioned(
            top:
                120, // Adjust this value to position the white container correctly
            left: 16,
            right: 16,
            bottom: 270, // Leave space for the button at the bottom
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
                    'assets/icon/email.png',
                    'Email & nomor HP',
                    'Alamat email dan nomor handphone yang valid.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/contactless.png',
                    'KTP pemilik usaha',
                    'Kartu Tanda Penduduk pemilik usaha.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/credit-card.png',
                    'Nomor rekening',
                    'Nomor rekening bank untuk transaksi.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/business.png',
                    'Dokumen pendukung',
                    'Dokumen yang mendukung kegiatan usaha.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/driving-license.png',
                    'NPWP pemilik usaha',
                    'Nomor Pokok Wajib Pajak pemilik usaha.',
                    30.0,
                  ),
                  _buildRequirement(
                    'assets/icon/map-pin.png',
                    'Alamat Lengkap',
                    'Alamat lengkap lokasi usaha.',
                    30.0,
                  ),
                ],
              ),
            ),
          ),
          // Continue Button
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        VerifikasiDataPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const offsetBegin = Offset(1.0, 0.0);
                      const offsetEnd = Offset.zero;
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
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(247, 97, 78, 1),  // Button color
                minimumSize: Size(double.infinity, 50), // Full-width button
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
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
          ),
        ],
      ),
    );
  }

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
}
