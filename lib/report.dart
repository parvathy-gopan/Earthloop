import 'package:codeshefs/pricelist.dart';
import 'package:codeshefs/userScreen.dart';
import 'package:flutter/material.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
          children: [
            Image.asset('assets/images/report.jpeg'),
            ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Minimum 200 credits required to redeem !!")));
              },
              child: Text('Reedem Credits - 40'),
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
          if (index == 0) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Account()),
            );
          }
          else if (index == 1) { // Index 1 corresponds to the Price List icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pricelist()),
            );
          }
        },
      ),
    );
  }
}
