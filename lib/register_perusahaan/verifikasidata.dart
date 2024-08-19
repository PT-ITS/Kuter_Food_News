// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/register.dart';
import 'package:kuterfood/register_perusahaan/aktivasidata.dart';
import 'package:kuterfood/register_perusahaan/pendaftarandata.dart';
import 'package:kuterfood/register_pribadi/aktivasi_layanan.dart';
import 'package:kuterfood/register_pribadi/pendaftaran_data.dart';

class VerifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(247, 97, 78, 1), // Background color of AppBar
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
                  bottomLeft:
                      Radius.circular(30), // Radius for the bottom-left corner
                  bottomRight:
                      Radius.circular(30), // Radius for the bottom-right corner
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
                          'assets/icon/ad2.png', // Replace with your icon path                         
                          width: 80, // Width of the icon
                          height: 80, // Height of the icon
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Verifikasi Data Usaha',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Data usaha yang anda kirim akan kami periksa untuk memastikan semuanya sudah lengkap dan sesuai.',
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
                    bottom: 106, // Align at the bottom of the orange container
                    left: 110,
                    right: 160,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
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
                            'Proses 2 hari kerja',
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

          // Floating White Container (Optional)
          // Positioned(
          //   top: 200, // Adjust this value to position the white container correctly
          //   left: 16,
          //   right: 16,
          //   bottom: 72, // Leave space for the buttons at the bottom
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           spreadRadius: 2,
          //           blurRadius: 3,
          //           offset: Offset(0, 1),
          //         ),
          //       ],
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Berikut data & dokumen yang perlu anda siapkan:',
          //           style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         SizedBox(height: 16),
          //         // Requirements
          //         _buildRequirement(Icons.email, 'Email & nomor HP'),
          //         _buildRequirement(Icons.credit_card, 'KTP pemilik usaha'),
          //         _buildRequirement(Icons.money, 'Nomor rekening'),
          //         _buildRequirement(Icons.document_scanner, 'Dokumen pendukung'),
          //         _buildRequirement(Icons.card_giftcard, 'NPWP pemilik usaha'),
          //         _buildRequirement(Icons.location_on, 'Alamat Lengkap'),
          //       ],
          //     ),
          //   ),
          // ),
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
                            PendaftaranPage(),
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
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AktivasiPage(),
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
                        Color.fromRGBO(247, 97, 78, 1),// Button color
                    minimumSize:
                        Size(190, 50), // Width and height of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius as needed
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
  Widget _buildRequirement(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromRGBO(247, 97, 78, 1),
          ),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
