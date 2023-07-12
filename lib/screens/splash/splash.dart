import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spotify_clone/screens/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatorHome();
  }

  navigatorHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset("assets/splash/logo.json"),
          ),
        ],
      ),
    );
  }
}