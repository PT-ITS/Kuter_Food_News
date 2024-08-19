import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kuterfood/email_login.dart';
import 'package:kuterfood/hp_login.dart';
import 'package:kuterfood/register.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Warna background AppBar
        elevation: 0, // Menghilangkan shadow
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Jarak antara logo dan tepi AppBar
            child: Image.asset(
              'assets/img/kf2.png', // Ganti dengan path ke logo Anda
              width: 120, // Ukuran logo
              height: 120, // Ukuran logo
              fit: BoxFit.contain,
            ),
          ),      
          SizedBox(width: 275), // Jarak antara logo dan tepi kanan AppBar jika diperlukan        
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background color
          Container(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          // Background image
          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/img/ob.png',
              width: screenWidth * 0.6, // Menggunakan 50% dari lebar layar
              height: screenWidth * 0.6, // Menjaga rasio aspek
              fit: BoxFit.contain,
            ),
          ),
          // Teks di bawah gambar
          Positioned(
            top: screenHeight * 0.40, // Posisi teks di bawah gambar
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Column(
              children: [
                Text(
                  'Selamat datang di KuFood',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Ukuran font
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Kelola usaha anda dengan aplikasi ini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Ukuran font
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // Buttons at the bottom
          Positioned(
            bottom: screenHeight * 0.05, // Posisi tombol di bagian bawah
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Jarak horizontal
              child: Column(
                children: [
                  // Masuk button
                  Container(
                    width: double.infinity, // Memanjang sesuai lebar kontainer
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HpLoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: const Color.fromRGBO(247, 97, 78, 1),
                      ),
                      child: Text(
                        'Masuk dengan nomor HP',
                        textAlign: TextAlign.center, // Memusatkan teks
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04),
                        overflow: TextOverflow.ellipsis, // Memotong teks jika terlalu panjang
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Daftar button
                  Container(
                    width: double.infinity, // Memanjang sesuai lebar kontainer
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailLoginPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Color.fromRGBO(247, 97, 78, 1), width: 2),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Masuk dengan email',
                        textAlign: TextAlign.center, // Memusatkan teks
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Color.fromRGBO(247, 97, 78, 1),
                        ),
                        overflow: TextOverflow.ellipsis, // Memotong teks jika terlalu panjang
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Text "Belum punya akun? Daftar KuFood"
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: screenWidth * 0.030,
                        color: Colors.black, // Warna default
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Belum punya akun? ',
                        ),
                        TextSpan(
                          text: 'Daftar KuFood',
                          style: TextStyle(
                            color: Color.fromRGBO(247, 97, 78, 1), // Warna oranye
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigasi ke halaman selanjutnya
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationPage(), // Ganti dengan halaman tujuan
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
