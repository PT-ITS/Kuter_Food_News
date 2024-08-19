import 'package:flutter/material.dart';

class StokHabisPage extends StatefulWidget {
  @override
  _StokHabisPageState createState() => _StokHabisPageState();
}

class _StokHabisPageState extends State<StokHabisPage> {
  // Dummy data for out-of-stock items with images
  List<Map<String, String>> outOfStockItems = [
    {'name': 'Item 1', 'image': 'assets/img/a2.png', 'quantity': '0'},
    {'name': 'Item 2', 'image': 'assets/img/a2.png', 'quantity': '0'},
    {'name': 'Item 3', 'image': 'assets/img/a2.png', 'quantity': '0'},
  ];

  // Function to mark an item as restocked
  void _markAsRestocked(int index) {
    setState(() {
      outOfStockItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stok Habis',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.grey[300], // Warna abu-abu untuk divider
              thickness: 1, // Ketebalan divider
              height: 20, // Jarak vertikal di sekitar divider
            ),
            SizedBox(height: 10), 
            Text(
              'Menu Stok Habis',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: outOfStockItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color.fromARGB(255, 219, 218, 218), width: 1), // Border color and width
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          outOfStockItems[index]['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Color.fromRGBO(247, 97, 78, 1), size: 40);
                          },
                        ),
                      ),
                      title: Text(
                        outOfStockItems[index]['name']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Jumlah Stok: ${outOfStockItems[index]['quantity']}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _markAsRestocked(index),
                        child: Text('Restock', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
