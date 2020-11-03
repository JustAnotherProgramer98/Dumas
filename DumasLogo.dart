import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double letraSize;
  const Logo({
    Key key,
    this.letraSize = 100,
  }) : super(key: key);
  const Logo.size({
    Key key,
    this.letraSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "DUMAS",
        style: TextStyle(
          color: Colors.white,
          fontSize: letraSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
