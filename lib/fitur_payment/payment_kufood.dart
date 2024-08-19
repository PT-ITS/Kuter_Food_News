import 'package:flutter/material.dart';

class PaymentKufoodPage extends StatefulWidget {
  @override
  _PaymentKufoodPageState createState() => _PaymentKufoodPageState();
}

class _PaymentKufoodPageState extends State<PaymentKufoodPage> {
  String? _selectedMethod; // Menggunakan String? untuk memungkinkan nilai null

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pembayaran Kufood',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pembayaran'),
              Tab(text: 'Riwayat Transaksi'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            // Halaman Pembayaran
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pilihan Metode Pembayaran
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildPaymentMethod('Kartu Kredit/Debit'),
                  SizedBox(height: 10),
                  _buildPaymentMethod('Transfer Bank'),
                  SizedBox(height: 10),
                  _buildPaymentMethod('e-Wallet'),
                  SizedBox(height: 20),

                  // Form Pembayaran
                  Text(
                    'Detail Pembayaran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildPaymentField('Jumlah Pembayaran', 'Rp 0'),
                  SizedBox(height: 50),

                  // Tombol Bayar
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk menyelesaikan pembayaran di sini
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Pembayaran Berhasil'),
                            content: Text('Pembayaran Anda telah berhasil diproses.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Tutup'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(247, 97, 78, 1),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 148), // Perlebar tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Bayar Sekarang',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Halaman Riwayat Transaksi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildTransactionDetail('Pengeluaran', 'Rp 50.000', '16 Aug 2024'),
                  SizedBox(height: 10),
                  _buildTransactionDetail('Pemasukan', 'Rp 100.000', '15 Aug 2024'),
                  SizedBox(height: 10),
                  _buildTransactionDetail('Pengeluaran', 'Rp 75.000', '14 Aug 2024'),
                  SizedBox(height: 10),
                  _buildTransactionDetail('Pemasukan', 'Rp 120.000', '13 Aug 2024'),
                  SizedBox(height: 10),
                  _buildTransactionDetail('Pengeluaran', 'Rp 60.000', '12 Aug 2024'),
                  SizedBox(height: 10),
                  _buildTransactionDetail('Pemasukan', 'Rp 90.000', '11 Aug 2024'),
                  // Tambah lebih banyak transaksi di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String method) {
    final isSelected = _selectedMethod == method;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey, width: 1),
      ),
        // Meningkatkan elevasi jika terpilih
      child: ListTile(
        title: Text(
          method,
          style: TextStyle(fontSize: 16),
        ),
        leading: Icon(Icons.payment, color: Color.fromRGBO(247, 97, 78, 1)),
        trailing: isSelected ? Icon(Icons.check_circle, color: Colors.green) : null,
        onTap: () {
          setState(() {
            _selectedMethod = method;
          });
        },
      ),
    );
  }

  Widget _buildPaymentField(String label, String placeholder) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        hintText: placeholder,
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildTransactionDetail(String type, String amount, String date) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
