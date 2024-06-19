import 'package:flutter/material.dart';
class leaderBoard extends StatefulWidget {
  const leaderBoard({Key? key}) : super(key: key);

  @override
  State<leaderBoard> createState() => _leaderBoardState();
}

class _leaderBoardState extends State<leaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
      children: [
        Image.asset('assets/images/leaderboard.jpeg'),

      ],
    )
    );
  }
}
