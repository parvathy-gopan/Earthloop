import 'package:codeshefs/collector_account.dart';
import 'package:codeshefs/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'userScreen.dart';
//import 'collectorscreen.dart';

class LoginCredPage extends StatefulWidget {
  @override
  _LoginCredPageState createState() => _LoginCredPageState();
}

class _LoginCredPageState extends State<LoginCredPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _selectedLoginType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedLoginType,
              decoration: InputDecoration(label: Text('Login As'),
                  border:OutlineInputBorder()),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLoginType = newValue;
                });
              },
              items: <String>[
                'User',
                'Collector',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(label: Text('E-mail'),
              border:OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(label: Text('Password'),
              border:OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

                _login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;
    // You can implement your login logic here
    // For now, let's print the entered details


    // Based on the selected login type, navigate to the appropriate screen
    if(username.isEmpty)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your user name")));
    else if(password.isEmpty)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your password")));
    else if (_selectedLoginType == 'User') {

        FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text).then(
                (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => Account(),))
        ).onError((error, stackTrace) {
          print("Error ${error.toString()}");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Credintials!!")));
        });


    } else if (_selectedLoginType == 'Collector') {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text).then(
              (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => pickup(),))
      ).onError((error, stackTrace) {
        print("Error ${error.toString()}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Credintials!!")));
      });

    }
  }
}
