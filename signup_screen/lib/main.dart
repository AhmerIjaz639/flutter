import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupScreen());
  }
}

class SignupScreen extends StatefulWidget {
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final nameController = TextEditingController();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup Done '), backgroundColor: const Color.fromARGB(255, 96, 4, 4)),
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,  
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

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 239, 237, 186),
              Color.fromARGB(255, 146, 226, 96),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
       
        child: Center(
          child: Container(
            width: 320,
            //height: 650,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 5, 89, 29),
                  const Color.fromARGB(255, 93, 103, 4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 40,
                  offset: Offset(0, 20),
                ),
              ],
            ),
            child:Form(
              key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "data:image/jpeg;base64,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",
                  ),
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    prefix: Icon(Icons.email, color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(
                      255,
                      234,
                      213,
                      105,
                    ).withOpacity(0.25),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Email !!';
                    }
                    if (!value.contains('@')) {
                      return 'Enter email using " @ "';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    prefix: Icon(Icons.person, color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Name !!';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(color: Colors.white),
                    prefix: Icon(Icons.lock, color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password !!';
                    }
                    if (value.length < 6) {
                      return 'Minimum 6 characters required !!';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: confirmpasswordController,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    labelStyle: TextStyle(color: Colors.white),
                    prefix: Icon(Icons.lock, color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                    if (value != passwordController.text) {
                      return 'Wrong Password ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 230, 229, 228),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 4, 48, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
