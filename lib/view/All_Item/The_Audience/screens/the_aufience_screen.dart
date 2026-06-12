import 'package:flutter/material.dart';

class TheAudienceScreen extends StatelessWidget {
  const TheAudienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'The Audience Screen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
