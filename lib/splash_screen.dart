import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uas_books_yandi/helper/data_theme.dart';
import 'package:uas_books_yandi/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Delay for 3 seconds
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Navigation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bookit', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
