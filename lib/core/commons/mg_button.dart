import 'package:flutter/material.dart';

class MgButton extends StatelessWidget {
  final String _label;
  final VoidCallback _onPressed;
  final Color _color;
  final Color _textColor;

  const MgButton({
    Key key,
    @required String label,
    @required VoidCallback onPressed,
    Color color,
    Color textColor,
  })  : _label = label,
        _onPressed = onPressed,
        _color = color,
        _textColor = textColor,
        assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(_label),
      onPressed: _onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(_color ?? Theme.of(context).buttonColor),
        foregroundColor: MaterialStateProperty.all(
            _textColor ?? Theme.of(context).textTheme.button.color),
      ),
    );
  }
}
