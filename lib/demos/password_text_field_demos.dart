import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '*';

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obscureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Password',
        suffix: _onVisibilityIcon(),
        prefix: const Icon(Icons.key_rounded),
        // suffixIcon: Icon(Icons.remove_red_eye), // This is the icon that will be displayed at the end of the text field
        // prefixIcon: Icon(Icons.key), // This is the icon that will be displayed at the start of the text field
      ),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: _changeLoading,
        icon: AnimatedCrossFade(
          firstChild: Icon(Icons.visibility_outlined),
          secondChild: Icon(Icons.visibility_off_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        ));
    // icon: Icon(_isSecure ? Icons.visibility_rounded : Icons.visibility_off_rounded));
  }
}
