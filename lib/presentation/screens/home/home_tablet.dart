import 'package:flutter/material.dart';

class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tablet Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
