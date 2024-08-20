import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kufood Order',
      debugShowCheckedModeBanner: false, // Hilangkan debug banner
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: KufoodOrderPage(),
    );
  }
}

class KufoodOrderPage extends StatefulWidget {
  const KufoodOrderPage({Key? key}) : super(key: key);

  @override
  State<KufoodOrderPage> createState() => _KufoodOrderPageState();
}

class _KufoodOrderPageState extends State<KufoodOrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kufood Order'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],     
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: const Color.fromRGBO(247, 97, 78, 1),
            labelColor: const Color.fromRGBO(247, 97, 78, 1),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Proses'),
              Tab(text: 'Selesai'),
              Tab(text: 'Batal'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrderTab(
                  orders: [
                    {
                      'id': '1',
                      'customerName': 'John Doe',
                      'items': [
                        {'name': 'Happy Meal Beef Burger', 'quantity': 2},
                        {'name': 'Medium french fries', 'quantity': 1},
                      ],
                      'status': 'In Process',
                      'createdAt': '2023-03-20 12:00:00',
                    },
                    {
                      'id': '2',
                      'customerName': 'Jane Doe',
                      'items': [
                        {'name': 'Chicken Burger', 'quantity': 1},
                        {'name': 'Large french fries', 'quantity': 1},
                      ],
                      'status': 'In Process',
                      'createdAt': '2023-03-20 12:30:00',
                    },
                  ],
                ),
                _buildOrderTab(
                  orders: [
                    {
                      'id': '3',
                      'customerName': 'John Smith',
                      'items': [
                        {'name': 'Spicy Burger', 'quantity': 1},
                        {'name': 'Small french fries', 'quantity': 1},
                      ],
                      'status': 'Completed',
                      'createdAt': '2023-03-20 11:00:00',
                    },
                  ],
                ),
                _buildOrderTab(
                  orders: [
                    {
                      'id': '4',
                      'customerName': 'Jane Smith',
                      'items': [
                        {'name': 'Double Burger', 'quantity': 1},
                        {'name': 'Onion Rings', 'quantity': 1},
                      ],
                      'status': 'Canceled',
                      'createdAt': '2023-03-20 10:00:00',
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTab({required List<dynamic> orders}) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
           color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.grey.shade300, // Border abu-abu
              width: 1.0, // Lebar border
            ),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID: ${order['id']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Customer Name: ${order['customerName']}'),
                const SizedBox(height: 8),
                Text('Status: ${order['status']}'),
                const SizedBox(height: 8),
                Text('Created At: ${order['createdAt']}'),
                const SizedBox(height: 16),
                const Text(
                  'Items:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                for (final item in order['items'])
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      '- ${item['name']} x ${item['quantity']}',
                    ),
                  ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Tolak Pesanan" action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(247, 97, 78, 1),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color.fromRGBO(247, 97, 78, 1), // Warna border oranye
                            width: 2.0, // Lebar border
                          ),
                        ),
                        elevation: 0, // Menghilangkan bayangan tombol
                      ),
                      child: const Text('Tolak Pesanan'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Terima" action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(247, 97, 78, 1), // Warna tombol oranye
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Terima',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
