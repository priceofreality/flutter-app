import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final int divisions;
  final ValueChanged<double> onChanged;

  late double _currentSliderValue = minValue;

  void _handleOnChanged(double value) {
    onChanged(value);
  }

  CustomSlider(
      {required this.maxValue,
      required this.minValue,
      required this.divisions,
      required this.onChanged});

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
          onChangeEnd: widget._handleOnChanged,
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
