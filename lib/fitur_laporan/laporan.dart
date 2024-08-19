import 'package:flutter/material.dart';
import 'package:kuterfood/fitur_laporan/laporan_penjualan.dart';

class LaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Restoran',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        // elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildReportSection(
              context,
              title: 'Laporan Penjualan Restoran',
              description: 'Lihat laporan penjualan restoran harian, mingguan, atau bulanan.',
              icon: Icons.attach_money,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LaporanPenjualanPage()),
                );
              },
            ),
            _buildReportSection(
              context,
              title: 'Laporan Inventaris Bahan',
              description: 'Tinjau laporan inventaris bahan makanan dan perlengkapan restoran.',
              icon: Icons.inventory,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => InventoryReportPage()),
                // );
              },
            ),
            _buildReportSection(
              context,
              title: 'Laporan Ulasan Pelanggan',
              description: 'Baca ulasan dan feedback pelanggan tentang restoran.',
              icon: Icons.rate_review,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FeedbackReportPage()),
                // );
              },
            ),
            _buildReportSection(
              context,
              title: 'Laporan Pembayaran dan Pendapatan',
              description: 'Pantau laporan pembayaran dan pendapatan dari restoran.',
              icon: Icons.account_balance_wallet,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FinancialReportPage()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportSection(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(247, 97, 78, 1),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
        onTap: onTap,
      ),
    );
  }
}


