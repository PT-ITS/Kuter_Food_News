import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LaporanPenjualanPage extends StatefulWidget {
  @override
  _LaporanPenjualanPageState createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Penjualan', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(context),
            SizedBox(height: 20),
            // Tabel Laporan
            _buildReportTable(),
            SizedBox(height: 20),
            // Grafik Penjualan
            _buildChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        border: Border.all(color: Colors.grey[300]!, width: 1.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Penjualan',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem(label: 'Tanggal', value: '${_selectedDate.day} ${_selectedDate.month} ${_selectedDate.year}'),
              _buildSummaryItem(label: 'Total Penjualan', value: 'Rp 10.000.000'),
              _buildSummaryItem(label: 'Total Produk', value: '150'),
            ],
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(247, 97, 78, 1), // Background color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Pilih Tanggal', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildReportTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        columns: [
          DataColumn(label: Text('Gambar')),
          DataColumn(label: Text('Tanggal')),
          DataColumn(label: Text('Nama Produk')),
          DataColumn(label: Text('Jumlah')),
          DataColumn(label: Text('Harga Total')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(
              Container(
                padding: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/img/adf.png', width: 50, height: 50, fit: BoxFit.cover),
                ),
              ),
            ),
            DataCell(Text('01/01/2024')),
            DataCell(Text('Produk A')),
            DataCell(Text('10')),
            DataCell(Text('Rp 500.000')),
          ]),
          DataRow(cells: [
            DataCell(
              Container(
                padding: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/img/adf.png', width: 50, height: 50, fit: BoxFit.cover),
                ),
              ),
            ),
            DataCell(Text('02/01/2024')),
            DataCell(Text('Produk B')),
            DataCell(Text('20')),
            DataCell(Text('Rp 1.000.000')),
          ]),
          DataRow(cells: [
            DataCell(
              Container(
                padding: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/img/adf.png', width: 50, height: 50, fit: BoxFit.cover),
                ),
              ),
            ),
            DataCell(Text('03/01/2024')),
            DataCell(Text('Produk C')),
            DataCell(Text('15')),
            DataCell(Text('Rp 750.000')),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 226, 226, 226),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 0),
                  FlSpot(1, 1),
                  FlSpot(2, 1.5),
                  FlSpot(3, 2),
                ],
                isCurved: true,
                colors: [Color.fromRGBO(247, 97, 78, 1),],
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
