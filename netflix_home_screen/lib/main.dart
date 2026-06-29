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
  final List<Map<String, String>> trending = const [
    {
      'title': 'Stranger Things',
      'image':
          'https://image.tmdb.org/t/p/w300/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
    },
    {
      'title': 'Money Heist',
      'image':
          'https://image.tmdb.org/t/p/w300/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
    },
    {
      'title': 'Breaking Bad',
      'image': 'https://image.tmdb.org/t/p/w300/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
    },
    {
      'title': 'Dark',
      'image':
          'https://image.tmdb.org/t/p/w300/apbrbWs8M9lyOpJYU5WXrpFbk1Z.jpg',
    },
    {
      'title': 'Narcos',
      'image':
          'https://image.tmdb.org/t/p/w300/rTmal9fDbwh5F0waol2hq35U4ah.jpg',
    },
  ];

  final List<Map<String, String>> action = const [
    {
      'title': 'Extraction',
      'image':
          'https://image.tmdb.org/t/p/w300/wlfDxbGEsW58vGhFljKkcR5IxDj.jpg',
    },
    {
      'title': 'The Gray Man',
      'image':
          'https://image.tmdb.org/t/p/w300/8cXbitsS6dWQ5gfMTZdorpW5Idf.jpg',
    },
    {
      'title': 'Red Notice',
      'image':
          'https://image.tmdb.org/t/p/w300/lAXONuqg41NwUMuzMiFvicDET9Y.jpg',
    },
    {
      'title': '6 Underground',
      'image':
          'https://image.tmdb.org/t/p/w300/lnWkyG3LLgbbrIEeyl5mK5VRFe4.jpg',
    },
    {
      'title': 'Triple Frontier',
      'image':
          'https://image.tmdb.org/t/p/w300/4FtMOcMJijpI7Jv3IjeSikYHbDN.jpg',
    },
  ];

  final List<Map<String, String>> comedy = const [
    {
      'title': 'Don\'t Look Up',
      'image':
          'https://image.tmdb.org/t/p/w300/th4E1yqsE8DGpAseLiUrI60Hf9t.jpg',
    },
    {
      'title': 'Glass Onion',
      'image':
          'https://image.tmdb.org/t/p/w300/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg',
    },
    {
      'title': 'Murder Mystery',
      'image':
          'https://image.tmdb.org/t/p/w300/bj2BoSBDn5LXh6VwcMOBajFE7S3.jpg',
    },
    {
      'title': 'The Adam Project',
      'image':
          'https://image.tmdb.org/t/p/w300/wFjboE0aFZNbVOF05fzrka9Fqyx.jpg',
    },
    {
      'title': 'Eurovision',
      'image':
          'https://image.tmdb.org/t/p/w300/9zrbgYyFvwH8sy5mv9GJEwEjSdb.jpg',
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Netflix",
              style: TextStyle(
                color: Color.fromARGB(221, 245, 3, 3),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Icon(Icons.search, size: 40, color: Colors.red),
          ),
        ],
      ),

   body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
         
          buildFeaturedBanner(),
          
          SizedBox(height: 20),
          
          
         buildMovieSection("Trending Now", trending),
          
          SizedBox(height: 20),
          
         
          buildMovieSection("Action Movies", action),
          
          SizedBox(height: 20),
          
         
          buildMovieSection("Comedy", comedy),
          
          SizedBox(height: 20),
          
        ],
      ),
   ),

    );
  }

  Widget  buildFeaturedBanner(){
    
       
           return Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      trending[1]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                            Colors.black,
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          trending[1]['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        // Genre tags
                        Text(
                          "Action • Thriller • Mystery",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.play_arrow, size: 28),
                              label: Text(
                                "Play",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                              ),
                            ),

                            SizedBox(width: 15),

                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.add, size: 28),
                              label: Text(
                                "My List",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  14,
                                  14,
                                  14,
                                ),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                 
                ],
              ),
            );

  }


 Widget buildMovieSection(String title, List<Map<String, String>> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      // SECTION TITLE
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      SizedBox(height: 10),
      
      // HORIZONTAL MOVIE LIST
      Container(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,          // ← Horizontal!
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: movies.length,                  // ← Dynamic count!
          itemBuilder: (context, index) {
            return buildMovieCard(movies[index]);    // ← Each card
          },
        ),
      ),
      
    ],
  );
}


Widget buildMovieCard(Map<String, String> movie) {
  return Container(
    width: 130,
    margin: EdgeInsets.symmetric(horizontal: 5),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image.network(
      movie['image']!,
      fit: BoxFit.cover,
    ),
  );
}
}
