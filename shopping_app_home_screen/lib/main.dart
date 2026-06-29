import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'TV', 'icon': Icons.tv_sharp, 'color': Colors.red},
    {'name': 'Phone', 'icon': Icons.phone, 'color': Colors.orange},
    {'name': 'Books', 'icon': Icons.book_sharp, 'color': Colors.blue},
    {'name': 'Laptop', 'icon': Icons.laptop, 'color': Colors.amber},
    {
      'name': 'Volleyball',
      'icon': Icons.sports_volleyball,
      'color': Colors.cyan,
    },
    {'name': 'Headphones', 'icon': Icons.headphones, 'color': Colors.pink},
    {'name': 'Car', 'icon': Icons.directions_car, 'color': Colors.brown},
    {'name': 'Camera', 'icon': Icons.camera_alt, 'color': Colors.purple},
    {'name': 'Watch', 'icon': Icons.watch, 'color': Colors.teal},
    {'name': 'Shoes', 'icon': Icons.hiking, 'color': Colors.deepOrange},
    {'name': 'Clothes', 'icon': Icons.checkroom, 'color': Colors.indigo},
    {'name': 'Games', 'icon': Icons.sports_esports, 'color': Colors.green},
    {'name': 'Music', 'icon': Icons.music_note, 'color': Colors.deepPurple},
    {'name': 'Food', 'icon': Icons.fastfood, 'color': Colors.redAccent},
    {'name': 'Pizza', 'icon': Icons.local_pizza, 'color': Colors.orange},
    {'name': 'Coffee', 'icon': Icons.coffee, 'color': Colors.brown},
    {'name': 'Fitness', 'icon': Icons.fitness_center, 'color': Colors.green},
    {'name': 'Medicine', 'icon': Icons.medical_services, 'color': Colors.red},
    {'name': 'Pets', 'icon': Icons.pets, 'color': Colors.orangeAccent},
    {'name': 'Travel', 'icon': Icons.flight, 'color': Colors.lightBlue},
    {'name': 'Home', 'icon': Icons.home, 'color': Colors.blueGrey},
    {
      'name': 'Shopping',
      'icon': Icons.shopping_bag,
      'color': Colors.purpleAccent,
    },
    {
      'name': 'Beauty',
      'icon': Icons.face_retouching_natural,
      'color': Colors.pinkAccent,
    },
    {'name': 'Bike', 'icon': Icons.pedal_bike, 'color': Colors.greenAccent},
    {'name': 'Gift', 'icon': Icons.card_giftcard, 'color': Colors.redAccent},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Smart Watch',
      'price': 12000,
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
    },
    {
      'name': 'Headphones',
      'price': 3500,
      'rating': 4.3,
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
    },
    {
      'name': 'iPhone',
      'price': 250000,
      'rating': 4.8,
      'image':
          'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=400',
    },
    {
      'name': 'Laptop',
      'price': 180000,
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    },
    {
      'name': 'Shoes',
      'price': 8000,
      'rating': 4.4,
      'image':
          'data:image/jpeg;base64,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',
    },
    {
      'name': 'Backpack',
      'price': 2500,
      'rating': 4.2,
      'image':
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    },
    {
      'name': 'Sunglasses',
      'price': 1500,
      'rating': 4.1,
      'image':
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
    },
    {
      'name': 'Camera',
      'price': 95000,
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400',
    },
    {
      'name': 'Perfume',
      'price': 3000,
      'rating': 4.3,
      'image':
          'https://images.unsplash.com/photo-1541643600914-78b084683601?w=400',
    },
    {
      'name': 'Gaming Controller',
      'price': 6000,
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1593118247619-e2d6f056869e?w=400',
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 179, 76),
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Ahmer ",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Let's Shop ! ",
              style: TextStyle(
                color: const Color.fromARGB(255, 238, 232, 232),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: const Color.fromARGB(255, 253, 253, 253),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 218, 11, 11),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 171, 207, 224),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        50,
                        46,
                        46,
                      ).withOpacity(0.5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 242, 242, 241),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Search food...",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 240, 239, 239),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Special Offer",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "50% OFF!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Shop Now"),
                        ),
                      ],
                    ),

                    Icon(Icons.fastfood, color: Colors.white, size: 60),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: category['color'].withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            category['icon'],
                            color: category['color'],
                            size: 30,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(category['name'], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Now",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ],
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2 , // 2 cards per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // card height control
              ),
              itemBuilder: (context, index) {
                return buildShoppingCard(products[index]);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(255, 105, 100, 95),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget buildShoppingCard(Map<String, dynamic> products) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(products['image'], fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.99)],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 4),
                  Text(
                    products['rating'].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Rs ${products['price']}",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
