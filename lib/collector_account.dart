import 'package:codeshefs/maps.dart';
import 'package:flutter/material.dart';

class pickup extends StatefulWidget {
  const pickup({Key? key}) : super(key: key);

  @override
  State<pickup> createState() => _pickupState();
}

class _pickupState extends State<pickup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Semantics(
              label: 'Salary',
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(Icons.wallet),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ),
            ),
            Semantics(
              label: 'Tips',
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(Icons.add_box_outlined
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ),
            ),
          ],
        ),
        body:
        ListView(
          children: [
            Image.asset('assets/images/pickup.jpeg'),
            //Image.asset('assets/images/pickuproute.jpeg'),
            ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
              },
              child: Text('Receive Order'),
            ),
          ],
        )
    );
  }
}