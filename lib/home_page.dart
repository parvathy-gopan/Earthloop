import 'package:codeshefs/loginpage.dart';
import 'package:codeshefs/signUp.dart';
import 'package:flutter/material.dart';

class collector extends StatefulWidget {
  const collector({Key? key}) : super(key: key);

  @override
  State<collector> createState() => _collectorState();
}

class _collectorState extends State<collector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDEEE7),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                SizedBox(
                    height: 700,
                    width: 5500,

                    child: Image.asset('assets/images/about.png')),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>LoginCredPage()),
                      );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Login'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('SignUp'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}