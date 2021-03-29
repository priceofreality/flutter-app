import 'package:flutter/material.dart';

class GridButton<T> extends StatefulWidget {
  final Widget title;
  final Widget subtitle;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  bool get _selected => value == groupValue;

  void _handleOnChanged() {
    if (!_selected) {
      onChanged(value);
    }
  }

  GridButton(
      {required this.title,
      required this.subtitle,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  _GridButtonState createState() => _GridButtonState();
}

class _GridButtonState<T> extends State<GridButton<T>> {
  @override
  Widget build(BuildContext context) {
    /*return GestureDetector(
      onTap: () => widget._handleOnChanged(),
      child: Container(
        child: widget.child,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: widget._selected ? 3 : 0,
            color: Theme.of(context).buttonColor,
          ),
        ),
      ),
    );*/

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: widget._selected ? Theme.of(context).buttonColor : Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          width: 2,
          color: Theme.of(context).buttonColor,
        ),
      ),
      child: ListTile(
          onTap: () => widget._handleOnChanged(),
          title: widget.title,
          subtitle: widget.subtitle),
    );
  }
}
