import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ResQGuide',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/image/welcomeBackground.png',
                width: 270,
                height: 270,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to ResQGuide!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We proudly present a comprehensive and reliable guide for emergency actions and rescues.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5467),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
