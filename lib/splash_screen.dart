// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'onboarding.dart'; // Import your OnboardingScreen

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Menentukan ukuran gambar berdasarkan ukuran layar
    final double logoWidth = screenWidth * 0.3; // 30% dari lebar layar
    final double logoHeight = logoWidth; // Menjaga rasio aspek 1:1
    final double splashWidth = screenWidth * 0.8; // 80% dari lebar layar
    final double splashHeight = splashWidth; // Menjaga rasio aspek 1:1

    // Navigates to the OnboardingScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OnboardingScreen()), // Replace with your OnboardingScreen
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background color
          Container(
            color: Color.fromARGB(255, 255, 255, 255), // Replace with your desired color
          ),
          Center(
            child: Image.asset(
              'assets/img/kf.png', // path to your logo image
              width: 150, // adjust size as needed
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
