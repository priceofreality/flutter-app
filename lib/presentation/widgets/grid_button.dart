import 'package:flutter/material.dart';

class GridButton<T> extends StatefulWidget {
  final Widget child;
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
      {required this.child,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  _GridButtonState createState() => _GridButtonState();
}

class _GridButtonState<T> extends State<GridButton<T>> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget._handleOnChanged(),
      child: Container(
        child: widget.child,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: widget._selected ? 3 : 0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
