import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/logo_takeatime.png',
        width: 185,
        height: 150,
      ),
    );
  }
}
