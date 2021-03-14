import 'package:flutter/material.dart';

class MgTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final bool _isPassword;

  const MgTextFormField({
    Key key,
    @required TextEditingController controller,
    @required String label,
    bool isPassword = false,
  })  : _controller = controller,
        _label = label,
        _isPassword = isPassword,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: _isPassword,
      decoration: InputDecoration(
        labelText: _label,
        hintText: _label,
        alignLabelWithHint: true,
      ),
    );
  }
}
