import 'package:codeshefs/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  String? _selectedPinCode;
  String? _selectedLoginType;
  final TextEditingController p1Controller = TextEditingController();
  final TextEditingController p2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Enter your details',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField<String>(
            value: _selectedLoginType,
            decoration: InputDecoration(label: Text('Register As'),
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
            controller: nameController,
            decoration: InputDecoration(label: Text('Name'),
                border:OutlineInputBorder()),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(label: Text('E-mail'),
                border:OutlineInputBorder()),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(label: Text('Address'),
                border:OutlineInputBorder()),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(label: Text('Phone Number'),
                border:OutlineInputBorder()),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField<String>(
            value: _selectedPinCode,
            decoration: InputDecoration(label: Text('Pincode'),
                border:OutlineInputBorder()),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPinCode = newValue;
              });
            },
            items: <String>[
              '680664',
              '680666',
              '680665',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextFormField(
            controller: p1Controller,
            decoration: InputDecoration(label: Text('Password'),
                border:OutlineInputBorder()),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: p2Controller,
            decoration: InputDecoration(label: Text('Confirm Password'),
                border:OutlineInputBorder()),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              // Handle saving data or moving to the next step
              _navigateToNextPage();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _navigateToNextPage() {
    String p1 = p1Controller.text;
    String p2 = p2Controller.text;
    // You can navigate to the next page or perform other actions
    // For now, let's print the entered details
    if(p1==p2) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: p1Controller.text).then((value) {
        print("Creted new account");
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => collector(),));
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully!!")));
    }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not mismatch!!")));
      }
  }
}
