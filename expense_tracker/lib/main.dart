import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DialogDemo(),
    );
  }
}

class DialogDemo extends StatefulWidget {
  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  void showSnackBar(){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' You said yes '), backgroundColor: const Color.fromARGB(255, 96, 4, 4)),
      );
  }
   void showSnackBarNO(){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' You said NO '), backgroundColor: const Color.fromARGB(255, 96, 4, 4)),
      );
  }

  
  void showMydialog(){
    showDialog(context: context, 
    
    builder:(BuildContext context ){
      return AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to continue?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              showSnackBar();
            },
            child:Text('Yes')
          ),
           TextButton(
            onPressed: (){
              Navigator.pop(context);
              showSnackBarNO();

            },
            child:Text('NO')
          )
        ],
      );
    },

     );
    
  }

    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 12, 85, 42),
                Color.fromARGB(255, 57, 62, 6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "Signup Form",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
       body: Center(
        child: ElevatedButton(
          onPressed: showMydialog,  // Button press = dialog open
          child: Text('Show Dialog'),
        ),
      ),
      );
      
      }
}
