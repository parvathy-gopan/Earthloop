import 'package:codeshefs/confirmed.dart';
import 'package:flutter/material.dart';

class orderconfirm extends StatefulWidget {
  const orderconfirm({Key? key}) : super(key: key);

  @override
  State<orderconfirm> createState() => _orderconfirmState();
}

class _orderconfirmState extends State<orderconfirm> {
  @override
  bool ischecked=false;

  bool _buttonDisabled = false;

  void _onButtonClicked() {
    // Perform some action
    // Disable the button after clicking
    setState(() {
      _buttonDisabled = true;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFDDEEE7),
      appBar: AppBar(),
      body: ListView(children: [
        Center(
          child: Column(children: [
            SizedBox(height: 20,),
            Text('February 2024',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledButton(
                      onPressed: _buttonDisabled ? null : _onButtonClicked,
                      child: Text('2'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledButton(
                      onPressed: () {
                      },
                      child: Text('4'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledButton(
                      onPressed: () {

                      },
                      child: Text('10'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('11'),
                    ),
                  ),]),
            Row( children :[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FilledButton(
                  onPressed: () {},
                  child: Text('15'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FilledButton(
                  onPressed: () {},
                  child: Text('18'),
                ),
              )
            ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(onPressed: _buttonDisabled ? null : _onButtonClicked, child: Text('9.00 AM -3 .00 PM')),
            ),
            Row(
              children: [
                Checkbox(value: ischecked, onChanged: (value) {
                  setState(() {
                    ischecked=true;
                  });
                },),
                Expanded(
                  child: Container(
                    child: Text('I agree that I have sorted my waste into recyclable and non-recyclable categories, ensuring proper disposal practices',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: FilledButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirmationAnimationWithTickMark(),));
              }, child: Text('Confirm')),
            )
          ]),
        ),
      ]),
    );
  }
}