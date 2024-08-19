import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'verifikasi_outlet.dart'; // Import the verification page

class FormOutletPage extends StatefulWidget {
  @override
  _FormOutletPageState createState() => _FormOutletPageState();
}

class _FormOutletPageState extends State<FormOutletPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _photo;

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Outlet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                height: 1, // Height of the divider
                color: Colors.grey[300], // Gray color for the divider
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Outlet',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when focused
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan nama outlet';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when focused
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    borderSide: BorderSide(color: Colors.grey), // Set border color when focused
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickPhoto,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Set border color
                    borderRadius: BorderRadius.circular(10), // Adjust the radius
                    image: _photo == null
                        ? null
                        : DecorationImage(
                            image: FileImage(_photo!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: _photo == null
                      ? Center(
                          child: Text(
                            'Tap to Upload Photo',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid, navigating to verification page');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifikasiOutletPage(),
        ),
      );
    } else {
      print('Form is invalid');
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromRGBO(247, 97, 78, 1),
    padding: EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Adjust the radius
    ),
  ),
  child: Text('Verifikasi', style: TextStyle(fontSize: 16, color: Colors.white)),
)

            ],
          ),
        ),
      ),
    );
  }
}
