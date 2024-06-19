import 'package:codeshefs/report.dart';
import 'package:codeshefs/userScreen.dart';
import 'package:flutter/material.dart';

class pricelist extends StatefulWidget {
  const pricelist({Key? key}) : super(key: key);

  @override
  State<pricelist> createState() => _pricelistState();
}

class _pricelistState extends State<pricelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [Image.asset('assets/images/pricelist.jpeg',width: 650)]),
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
          if (index == 2) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Report()),
            );
          }
          else if (index == 0) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Account()),
            );
          }
        },
      ),
    );
  }
}