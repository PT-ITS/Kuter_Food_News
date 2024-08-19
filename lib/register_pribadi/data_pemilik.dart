// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuterfood/register.dart'; // Adjust the imports as necessary

class IsiDataPemilikPage extends StatefulWidget {
  @override
  _IsiDataPemilikPageState createState() => _IsiDataPemilikPageState();
}

class _IsiDataPemilikPageState extends State<IsiDataPemilikPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 97, 78, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Isi data pemilik',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Orange Container
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 97, 78, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: 120, // Reduced height
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12), // Reduced padding
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 12), // Reduced width
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Verifikasi Data Usaha',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 18, // Reduced font size
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: 6), // Reduced height
                            Text(
                              'Email & nomor HP akan digunakan untuk komunikasi terkait proses pendaftaran, masuk ke KuFood, menerima laporan pendapatan, validasi perubahan data rekening, dll.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12, // Reduced font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Form Container
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12), // Reduced padding
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30), // Reduced height
                    _buildTextField(
                      title: 'Nama Pemilik',
                      controller: _nameController,
                      label: 'Masukkan nama sesuai KTP',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Pemilik tidak boleh kosong';
                        }
                        return null;
                      },
                      titleStyle: TextStyle(
                        fontSize: 16, // Updated font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black, // Black color
                      ),
                    ),
                    SizedBox(height: 12), // Reduced height
                    _buildTextField(
                      title: 'Email',
                      controller: _emailController,
                      label: 'Cth: balinakufood@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Masukkan email yang valid';
                        }
                        return null;
                      },
                      titleStyle: TextStyle(
                        fontSize: 16, // Updated font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black, // Black color
                      ),
                    ),
                    SizedBox(height: 12), // Reduced height
                    _buildTextField(
                      title: 'Nomor HP',
                      controller: _phoneController,
                      label: '+62 81xxxxxxxx',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor HP tidak boleh kosong';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Masukkan nomor HP yang valid';
                        }
                        return null;
                      },
                      titleStyle: TextStyle(
                        fontSize: 16, // Updated font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black, // Black color
                      ),
                    ),
                    SizedBox(height: 295), // Reduced height
                    // Button at the Bottom
                    Padding(
                      padding: const EdgeInsets.all(12), // Reduced padding
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle form submission
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SomeNextPage(), // Adjust navigation as needed
                            //   ),
                            // );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Kirim Data Pemilik',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String title,
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
    TextStyle? titleStyle, // Added parameter for title style
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? TextStyle(
            fontSize: 14, // Default font size
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 4), // Reduced height
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8), // Reduced padding
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400]!, // Line color
                width: 2, // Line thickness
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(247, 97, 78, 1), // Focused line color
                width: 2, // Line thickness
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
