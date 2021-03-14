import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int divisions;

  late double _currentSliderValue = minValue;

  CustomSlider(
      {required this.maxValue,
      required this.minValue,
      required this.divisions});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '-${widget._currentSliderValue}€',
          style: TextStyle(fontSize: 14.7),
        ),
        Slider(
          activeColor: Theme.of(context).buttonColor,
          value: widget._currentSliderValue,
          min: widget.minValue,
          max: widget.maxValue,
          divisions: widget.divisions,
          label: widget._currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              widget._currentSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
