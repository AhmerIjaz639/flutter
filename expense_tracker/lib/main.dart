import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NamesScreen(),
    );
  }
}

class NamesScreen extends StatefulWidget {
  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  List<String> names =[];
  final nameController = TextEditingController();
  void addname(){
    if (nameController.text.isEmpty){
      return;
    }
    setState(() {
      names.add(nameController.text);
    });
    nameController.clear();
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text('Name added '),backgroundColor: Colors.green,));

  }
  

  Widget build (BuildContext context ){
    return Scaffold(


    );
  }

  
 
}