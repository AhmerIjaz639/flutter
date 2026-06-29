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
  // ─── CATEGORIES DATA ───
  final List<Map<String, dynamic>> categories = [
    {'name': 'Pizza', 'icon': Icons.local_pizza, 'color': Colors.red},
    {'name': 'Burger', 'icon': Icons.lunch_dining, 'color': Colors.orange},
    {'name': 'Sushi', 'icon': Icons.set_meal, 'color': Colors.blue},
    {'name': 'Pasta', 'icon': Icons.ramen_dining, 'color': Colors.amber},
    {'name': 'Drinks', 'icon': Icons.local_drink, 'color': Colors.cyan},
    {'name': 'Cake', 'icon': Icons.cake, 'color': Colors.pink},
    {'name': 'Coffee', 'icon': Icons.coffee, 'color': Colors.brown},
  ];
  
  // ─── FOODS DATA ───
  final List<Map<String, dynamic>> foods = [
    {
      'name': 'Chicken Biryani',
      'price': 370,
      'rating': 4.5,
      'image': 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=400',
    },
    {
      'name': 'Pizza',
      'price': 1200,
      'rating': 4.2,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZEDbMMODDvPufQCFRZgFYLGx_6ixRWPNt2kIKQf2vg&s=10',
    },
    {
      'name': 'Pasta',
      'price': 550,
      'rating': 4.5,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1FsQF93OfXg3zWJZV9sTchDe5o6d3tLwhfRVujeTPVw&s=10',
    },
    {
      'name': 'Burger',
      'price': 799,
      'rating': 4.7,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaSbtcrczQGasl-f4hgUprZ0Z_yPB5BDPIxKN8OijsUA&s=10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      
      // ─── APP BAR ───
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Ahmer 👋",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "What would you like to eat?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=12',
              ),
            ),
          ),
        ],
      ),
      
      // ─── BODY ───
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // ─── SEARCH BAR ───
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search food...",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            
            // ─── CATEGORIES TITLE ───
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            SizedBox(height: 10),
            
            // ─── HORIZONTAL CATEGORIES ───
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
                        Text(
                          category['name'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            SizedBox(height: 20),
            
            // ─── POPULAR TITLE ───
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Now",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 10),
            
            // ─── FOOD CARDS LIST ───
            ListView.builder(
              shrinkWrap: true,  
              physics: NeverScrollableScrollPhysics(), 
              padding: EdgeInsets.all(15),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return buildFoodCard(foods[index]);
              },
            ),
            
          ],
        ),
      ),
      
      // ─── BOTTOM NAVIGATION ───
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  
  // ─── HELPER: FOOD CARD ───
  Widget buildFoodCard(Map<String, dynamic> food) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(food['image'], fit: BoxFit.cover),
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
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
                    food['rating'].toString(),
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
                  food['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Rs ${food['price']}",
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