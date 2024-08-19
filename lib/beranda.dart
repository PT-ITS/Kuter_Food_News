// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/fitur_bantuan/bantuan.dart';
import 'package:kuterfood/fitur_laporan/laporan.dart';
import 'package:kuterfood/fitur_menu/menu_kufood.dart';
import 'package:kuterfood/fitur_outlet/outlet_kufood.dart';
import 'package:kuterfood/fitur_payment/payment_kufood.dart';
import 'package:kuterfood/fitur_stokhabis/stok_habis.dart';
import 'package:kuterfood/fitur_tips/tips.dart';
import 'package:kuterfood/fitur_ulasan/ulasan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kufood App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final _isSaldoVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isSaldoVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
        ),
      ),
      backgroundColor: Color.fromRGBO(241, 242, 244, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 97, 78, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 5),
                      child: Text(
                        "Nama Restoran", // Replace with user's name
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 20),
                      child: Text(
                        "+62 812-3456-7890", // Replace with user's phone number
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: GestureDetector(
                    onTap: () {
                      print("Profil di klik");
                    },
                    child: Container(
                      width: 44,
                      height: 42,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(247, 97, 78, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Location Card
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1),
                      Text(
                        "Jalan Raya No.123, Kota X, Indonesia", // Replace with location info
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Existing Card
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with Divider
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icon/transfer.png', // Path to your asset
                            color: Color.fromRGBO(247, 97, 78, 1),
                            width: 20, // Adjust size as needed
                            height: 20, // Adjust size as needed
                          ),
                          SizedBox(height: 5), // Space between icon and text
                          Text(
                            "Transaksi Hari Ini",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "150",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Color.fromARGB(139, 189, 189, 189),
                      thickness: 4.0,
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icon/wallet.png', // Use asset instead of Icon
                            color: Color.fromRGBO(247, 97, 78, 1),
                            width: 20, // Adjust size as needed
                            height: 20, // Adjust size as needed
                          ),
                          SizedBox(height: 5), // Space between icon and text
                          Text(
                            "Saldo KuFood",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isSaldoVisible,
                            builder: (context, isVisible, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    isVisible ? "Rp 100.000" : "***********",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color.fromRGBO(114, 114, 114, 1),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      _isSaldoVisible.value =
                                          !_isSaldoVisible.value;
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),
                // Update Info Section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Terakhir diupdate 07-08-2024    | ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "12:34", // Replace with actual time
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        color: Colors.grey,
                        onPressed: () {
                          // Add refresh logic here
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),

          // FITUR KUTERSSS
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // Uncomment if you need a shadow
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(139, 189, 189, 189),
              //     offset: Offset(0, 4),
              //     blurRadius: 10,
              //   ),
              // ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fitur KuFood", // Replace with your actual title
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Adjust color as needed
                      ),
                    ),
                    SizedBox(
                        height: 20), // Space between title and feature icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/package.png',
                            label: "Stok habis",
                            onTap: () {
                              // Add functionality here
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StokHabisPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/menu.png',
                            label: "Menu",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuKufoodPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/outlet.png',
                            label: "Outlet saya",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OutletKufoodPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/link.png',
                            label: "Payment",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentKufoodPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Add spacing between rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/result.png',
                            label: "Laporan",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LaporanPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/review.png',
                            label: "Ulasan",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UlasanPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/help.png',
                            label: "Bantuan",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BantuanPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10), // Adjust horizontal spacing
                        Expanded(
                          child: FeatureIcon(
                            assetPath: 'assets/icon/idea.png',
                            label: "Tips",
                            onTap: () {
                              // Add functionality here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TipsPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Solusi makanan anda", // Replace with your actual title
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust color as needed
                  ),
                ),
                SizedBox(height: 15), // Space between title and banner
                Container(
                  height: 200,
                  child: PageView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 10), // Add spacing between banners
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust radius as needed
                          child: Image.asset(
                            'assets/img/b2.png', // Path to your asset
                            fit: BoxFit
                                .cover, // Ensure image covers the container
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 10), // Add spacing between banners
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust radius as needed
                          child: Image.asset(
                            'assets/img/b3.png', // Path to your asset
                            fit: BoxFit
                                .cover, // Ensure image covers the container
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 10), // Add spacing between banners
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust radius as needed
                          child: Image.asset(
                            'assets/img/b1.png', // Path to your asset
                            fit: BoxFit
                                .cover, // Ensure image covers the container
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;

  FeatureIcon({
    required this.assetPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            width: 40, // Adjust size as needed
            height: 40, // Adjust size as needed
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
