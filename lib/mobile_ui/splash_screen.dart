import 'package:flutter/material.dart';
import 'package:ven/mobile_ui/products_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 2 seconds and then navigate to the home screen.
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Product()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen content here
            FlutterLogo(
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Ven',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
