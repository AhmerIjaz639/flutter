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
  
  // 1. List to store names
  List<String> names = [];
  
  // 2. Controller for TextField
  final nameController = TextEditingController();
  
  // 3. Function to add name
  void addName() {
    // Empty check
    if (nameController.text.isEmpty) {
      return;
    }
    
    setState(() {
      names.add(nameController.text);  // List mein add
    });
    
    nameController.clear();  // Field empty
    Navigator.pop(context);  // Dialog close
    
    // Success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Name added! ✅'),
        backgroundColor: Colors.green,
      ),
    );
  }
  
  // 4. Function to show dialog
  void showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Name'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Type name here...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: addName,
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
  
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names List 📝'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: names.isEmpty
          ? _buildEmptyState()
          : _buildNamesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  
  // Empty state
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'No names yet!',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Tap + to add a name',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
  
  // Names list
  Widget _buildNamesList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: names.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(names[index]),
          ),
        );
      },
    );
  }
}