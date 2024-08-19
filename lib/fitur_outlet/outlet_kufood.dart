import 'package:flutter/material.dart';
import 'package:kuterfood/fitur_outlet/form_outlet_page.dart'; // Import the form page
import 'package:kuterfood/fitur_outlet/detail_outlet.dart';

class OutletKufoodPage extends StatefulWidget {
  @override
  _OutletKufoodPageState createState() => _OutletKufoodPageState();
}

class _OutletKufoodPageState extends State<OutletKufoodPage> {
  List<String> outlets = ["Outlet 1", "Outlet 2", "Outlet 3"];

  void _addOutlet() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormOutletPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Outlet KuFood',
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
              color: Colors.grey[300],
              thickness: 1,
              height: 20,
            ),
            SizedBox(height: 10),
            Text(
              'Daftar outlet',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: outlets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: Icon(
                      Icons.store,
                      color: Color.fromRGBO(247, 97, 78, 1),
                      size: 40,
                    ),
                    title: Text(
                      outlets[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                    onTap: () {
                      // Navigate to DetailOutletPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailOutletPage(
                            outletName: outlets[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _addOutlet,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
