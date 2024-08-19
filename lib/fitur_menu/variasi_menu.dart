import 'package:flutter/material.dart';

class VariasiMenuPage extends StatefulWidget {
  @override
  _VariasiMenuPageState createState() => _VariasiMenuPageState();
}

class _VariasiMenuPageState extends State<VariasiMenuPage> {
  List<String> variations = []; // List to store variations

  void _addVariation(String variation) {
    setState(() {
      variations.add(variation);
    });
  }

  void _editVariation(int index, String newVariation) {
    setState(() {
      variations[index] = newVariation;
    });
  }

  void _deleteVariation(int index) {
    setState(() {
      variations.removeAt(index);
    });
  }

  void _showAddVariationDialog() {
    final _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          'Tambah Variasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Nama Variasi',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Batal',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _addVariation(_controller.text);
                Navigator.pop(context);
              }
            },
            child: Text('Simpan'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(247, 97, 78, 1),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditVariationDialog(int index) {
    final _controller = TextEditingController(text: variations[index]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          'Edit Variasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Nama Variasi',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Batal',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _editVariation(index, _controller.text);
                Navigator.pop(context);
              }
            },
            child: Text('Simpan'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(247, 97, 78, 1),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Variasi Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kelola variasi menu di sini.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: variations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(variations[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showEditVariationDialog(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteVariation(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showAddVariationDialog,
              child: Text('Tambah Variasi'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
