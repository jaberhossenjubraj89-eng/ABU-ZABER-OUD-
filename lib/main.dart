import 'package:flutter/material.dart';

void main() {
  runApp(const AbuZaberOudApp());
}

class AbuZaberOudApp extends StatelessWidget {
  const AbuZaberOudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abu Zaber Oud',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFD4AF37), // Golden Accent
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFFC5A059),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String volume;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.volume,
    required this.description,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Abu Zaber Oud Signature Oil',
      price: 2500,
      category: 'Oud Oil',
      volume: '12 ml',
      description: 'Natural & Alcohol-Free Luxury Oud Experience.',
    ),
    Product(
      id: '2',
      name: 'White Oud Arabic Attar',
      price: 1200,
      category: 'Attar Oil',
      volume: '6 ml',
      description: '100% Pure White Oud Arabic Concentrated Oil.',
    ),
    Product(
      id: '3',
      name: 'Musk Tahara Luxury Box',
      price: 950,
      category: 'Musk',
      volume: '6 ml',
      description: 'Thick, creamy white musk in custom gift packaging.',
    ),
    Product(
      id: '4',
      name: 'Dehn Al Oudh Pure Extract',
      price: 3000,
      category: 'Pure Oud',
      volume: '3 ml',
      description: 'Aged concentrated pure Oud with glass dip stick.',
    ),
    Product(
      id: '5',
      name: 'Sunnah Combo Pack',
      price: 750,
      category: 'Combo',
      volume: '3 ml + Miswak',
      description: 'Krov Shahida Attar with Premium Vacuum Sealed Miswak.',
    ),
  ];

  final List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFD4AF37),
        content: Text('${product.name} কার্টে যোগ করা হয়েছে!', style: const TextStyle(color: Colors.black)),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'ABU ZABER OUD',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${cart.length}'),
              isLabelVisible: cart.isNotEmpty,
              child: const Icon(Icons.shopping_bag_outlined, color: Color(0xFFD4AF37)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Container(
              width: double.infinity,
              height: 160,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2C221E), Color(0xFF121212)],
                ),
                border: Border.all(color: const Color(0xFFD4AF37), width: 1),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LUXURY OUD EXPERIENCE',
                    style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                  SizedBox(height: 6),
                  Text('Natural & Alcohol-Free Premium Attar', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Our Collection', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37))),
            ),

            // Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                final item = products[i];
                return Card(
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFF333333)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.opacity, color: Color(0xFFD4AF37), size: 50),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text('${item.category} • ${item.volume}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text('৳${item.price.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          height: 32,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD4AF37),
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () => addToCart(item),
                            child: const Text('Add to Cart', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;
  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final double total = cart.fold(0, (sum, item) => sum + item.price);
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Bag'), backgroundColor: Colors.black),
      body: cart.isEmpty
          ? const Center(child: Text('আপনার কার্ট খালি!'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (ctx, i) => ListTile(
                        title: Text(cart[i].name),
                        subtitle: Text('${cart[i].volume} - ৳${cart[i].price}'),
                      ),
                    ),
                  ),
                  const Divider(color: Color(0xFFD4AF37)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('৳${total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'আপনার নাম', border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'মোবাইল নম্বর', border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(controller: addressCtrl, decoration: const InputDecoration(labelText: 'ডেলিভারি ঠিকানা', border: OutlineInputBorder())),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Order Confirmed!'),
                            content: Text('ধন্যবাদ ${nameCtrl.text}! আপনার অর্ডারটি সফলভাবে নেওয়া হয়েছে।'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('OK'),
                              )
                            ],
                          ),
                        );
                      },
                      child: const Text('CONFIRM ORDER', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
