import 'package:codeshefs/camera.dart';
import 'package:codeshefs/leaderboard.dart';
import 'package:codeshefs/orderconfirm.dart';
import 'package:codeshefs/pricelist.dart';
import 'package:codeshefs/report.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int sum = 0;
  bool _buttonDisabled = false;
  bool _buttonDisabled1 = false;
  bool _buttonDisabled2 = false;
  bool _buttonDisabled3 = false;

  final paperController = TextEditingController();
  final plasticController = TextEditingController();
  final ewasteController = TextEditingController();
  final bioController = TextEditingController();


  void _onButtonClicked() {
    setState(() {
      int myInteger = int.parse(paperController.text);

      sum += 10*myInteger;
      _buttonDisabled = true;
    });
  }

  void _onButtonClicked1() {
    setState(() {
      int myInteger = int.parse(plasticController.text);
      sum += 20*myInteger;
      _buttonDisabled1 = true;
    });
  }

  void _onButtonClicked2() {
    setState(() {
      int myInteger = int.parse(ewasteController.text);
      sum += 100*myInteger;
      _buttonDisabled2 = true;
    });
  }

  void _onButtonClicked3() {
    setState(() {
      _buttonDisabled3 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Color(0xFFDDEEE7),
      appBar: AppBar(
        title: Text('CREDITS:40',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => camera(),));
          }, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => leaderBoard()));
          }, icon: Icon(Icons.leaderboard)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*SizedBox(
                  height: 500,
                  width: 500,
                  child: Image.asset('assets/images/user.jpg')),*/
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 400,
                          width: 300,
                          child: Image.asset('assets/images/user.jpeg')),
                    ]),
              ),
              SizedBox(
                width: 105,height: 100,
                child: ElevatedButton(
                  onPressed: _buttonDisabled ? null : _onButtonClicked,
                  child: Text('  Paper    (10 /kg)'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                  controller: paperController,
                  decoration: InputDecoration(labelText: "Enter weight in kilogram"),
                ),
              ),


              SizedBox(
                width: 105,height: 100,
                child: ElevatedButton(
                  onPressed: _buttonDisabled1 ? null : _onButtonClicked1,
                  child: Text('  Plastic  (20 /kg)'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                  controller: plasticController,
                  decoration: InputDecoration(labelText: "Enter weight in kilogram"),
                ),
              ),
              SizedBox(
                width: 105,height: 100,
                child: ElevatedButton(
                  onPressed: _buttonDisabled2 ? null : _onButtonClicked2,
                  child: Text('EWaste  (100 /kg)'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                  controller: ewasteController,
                  decoration: InputDecoration(labelText: "Enter weight in kilogram"),
                ),
              ),

              // SizedBox(
              //   width: 105,height: 100,
              //   child: ElevatedButton(
              //     onPressed: _buttonDisabled3 ? null : _onButtonClicked3,
              //     child: Text('Biomedical (0 /kg)'),
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              //   child: TextField(
              //     controller: bioController,
              //     decoration: InputDecoration(labelText: "Enter weight in kilogram"),
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => orderconfirm()),
                  );
                },
                child: Text('Schedule a pickup'),
              ),
              const SizedBox(height: 20),
              Center(child: Text('Estimated credits = $sum',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_check_sharp),
            label: 'Price List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Report',
          ),
        ],
        onTap: (int index) {
          if (index == 1) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pricelist()),
            );
          }
          else if (index == 2) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Report()),
            );
          }
        },
      ),

    );
  }
}