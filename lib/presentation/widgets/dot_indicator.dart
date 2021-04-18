import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DotIndicator extends StatefulWidget {
  final length;
  final PageController controller;

  DotIndicator({required this.length, required this.controller});

  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  double currentPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPosition = widget.controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: DotsIndicator(
        dotsCount: widget.length,
        position: currentPosition,
        decorator: DotsDecorator(
          activeColor: Theme.of(context).accentColor,
          activeSize: Size.square(15.0),
        ),
      ),
    );
  }
}
