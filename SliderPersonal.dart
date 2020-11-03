import 'package:flutter/material.dart';

class SliderPersonal extends StatefulWidget {
  @override
  _SliderPersonalState createState() => _SliderPersonalState();
}

class _SliderPersonalState extends State<SliderPersonal> {
  double slider = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: Slider(
        activeColor: Color.fromRGBO(61, 126, 166, 1),
        inactiveColor: Color.fromRGBO(178, 222, 236, 1),
        value: slider,
        min: 0,
        max: 100,
        divisions: 20,
        label: slider.round().toString(),
        onChanged: (double value) {
          setState(() {
            slider = value;
          });
        },
      ),
    );
  }
}
