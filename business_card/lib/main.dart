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

final List<Map<String, dynamic>> directory = [
  {
    'name': 'Adolf Sane',
    'role': 'CEO',
    'company': 'ABC Company',
    'email': 'ahmer@email.com',
    'phone': '+92 300 1234567',
    'website': 'www.ahmer.com',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpN4zcuwhB2gL4cHQfY0rLOBlSyaIJaDgvMUVEeFWhBw&s=10',
  },
  {
    'name': 'Santy Altlady',
    'role': 'CTO',
    'company': 'ABC Company',
    'email': 'sara@email.com',
    'phone': '+92 301 2345678',
    'website': 'www.sara.com',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6MZSsDSFYC5pXpuOGpSfL1XqBDx67zPgqVfQwVAp1NA&s=10',
  },
  {
    'name': 'John Doe',
    'role': 'Designer',
    'company': 'Creative Studio',
    'email': 'john@email.com',
    'phone': '+92 302 3456789',
    'website': 'www.john.com',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiQSL3jJAU1y_JyxfegHtr0g8PV_Owi373J5hqRNL9qw&s=10',
  },
  {
    'name': 'Jane Smith',
    'role': 'Manager',
    'company': 'Tech Solutions',
    'email': 'jane@email.com',
    'phone': '+92 303 4567890',
    'website': 'www.jane.com',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxBtea7w6towTWT6G14tgXhDDcHhDbEx8gDTdFwtPr0g&s',
  },
 
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 38, 55),
                Color.fromARGB(255, 0, 174, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        title: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello, Ahmer",
              style: TextStyle(color: Color.fromARGB(221, 230, 229, 229),
               fontSize: 30,
               fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),

     body: SingleChildScrollView(
      child:Column(
        children: [
          
            GridView.builder(

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: directory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width < 320 ? 1 : 2, // 2 cards per row
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 0.60, // card height control
              ),
              itemBuilder: (context, index) {
                return buildBusinessCard(directory[index]);
              },
            ),
        ],
      ),
     ),
    );
  }

Widget buildBusinessCard(Map<String,dynamic>directory){
  return Container(
      width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 38, 55),
                Color.fromARGB(255, 0, 174, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
           
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 40,
                offset: Offset(0, 20),
              ),
            ],
          ),

        child:Column(
          
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(directory['image']),
            ),
            SizedBox(height: 5,),
            Text(
              directory['name'],
              style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,
                color: Colors.white,

              ),
            ),
             SizedBox(height: 5,),
            Text(
              directory['role'],
              style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.bold,
                color: Colors.white,

              ),),
               SizedBox(height: 5,),

              Divider(
                color: const Color.fromARGB(255, 44, 48, 50),
                thickness: 2,
              ),

              Row(
                children: [
                  Icon(Icons.email, color: const Color.fromARGB(255, 235, 111, 86), size: 22),

                  SizedBox(width: 5),

                  Text(
                    directory['email'],
                    style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 248, 245, 245)),
                  ),
                ],
              ),

                 Row(
                children: [
                  Icon(Icons.work_sharp, color: const Color.fromARGB(255, 91, 44, 3), size: 22),

                  SizedBox(width: 5),

                  Text(
                    directory['company'],
                    style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 248, 245, 245)),
                  ),
                ],
              ),

                 Row(
                children: [
                  Icon(Icons.phone, color: const Color.fromARGB(255, 197, 7, 7), size: 22),

                  SizedBox(width: 5),

                  Text(
                    directory['phone'],
                    style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 248, 245, 245)),
                  ),
                ],
              ),

              
                 Row(
                children: [
                  Icon(Icons.web, color: const Color.fromARGB(255, 12, 99, 4), size: 22),

                  SizedBox(width: 10),

                  Text(
                    directory['website'],
                    style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 248, 245, 245)),
                  ),
                ],
              ),


              
          ],
        ),


  );
}
}
