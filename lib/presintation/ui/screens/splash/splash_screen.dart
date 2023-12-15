import 'package:flutter/material.dart';
import 'package:notely/presintation/ui/resources/app_styles.dart';
import 'package:notely/presintation/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future nextPage() {
    return Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade600,
            Colors.blue.shade500,
            Colors.blue.shade400,
            Colors.blue.shade300,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500,
            Colors.blue.shade600,
            Colors.blue.shade700,
          ],
        )),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png'),
            const SizedBox(height: 30),
            Text('Notely', style: AppStyle.getSplash()),
          ],
        ),
      ),
    );
  }
}
