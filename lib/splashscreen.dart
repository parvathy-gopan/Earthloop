import 'package:flutter/material.dart';
import 'package:codeshefs/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds and then navigate to LoginPage
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => collector()),
      );
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
           /* Image(
              image: NetworkImage(
                  'https://m.media-amazon.com/images/S/aplus-media-library-service-media/ede328f6-882f-475e-8566-b4fdd0cce9d0.__CR0,140,1610,498_PT0_SX970_V1___.jpg'),
              fit: BoxFit.contain,
            )*/
            Image.asset('assets/images/logo.jpg'),
          ],
        ),
      ),
    );
  }
}
