import 'package:flutter/material.dart';

class DotIndicatorGroup extends StatefulWidget {
  final PageController controller;
  DotIndicatorGroup({required this.controller});

  @override
  _DotIndicatorGroupState createState() => _DotIndicatorGroupState();
}

class _DotIndicatorGroupState extends State<DotIndicatorGroup> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _index = widget.controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotIndicator(
            value: 0,
            groupValue: _index,
          ),
          SizedBox(
            width: 20.0,
          ),
          DotIndicator(
            value: 1,
            groupValue: _index,
          ),
          SizedBox(
            width: 20.0,
          ),
          DotIndicator(
            value: 2,
            groupValue: _index,
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int value;
  final int groupValue;

  bool get _selected => value == groupValue;

  DotIndicator({required this.value, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _selected ? 13 : 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _selected ? Theme.of(context).accentColor : Colors.grey,
      ),
    );
  }
}
