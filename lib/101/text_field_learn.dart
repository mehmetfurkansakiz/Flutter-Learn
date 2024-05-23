import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  @override
  _TextFieldLearnState createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Learn'),
      ),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            inputFormatters: [_TextProjectInputFormatter()._formatter],
            textInputAction: TextInputAction.next,
            decoration: _InputDecorator().emailInput,
          ),
          TextFormField(
            minLines: 2,
            maxLines: 4,
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
    );
  }
}

class _TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.contains('@')) {
      return oldValue;
    }
    return newValue;
  });
}

class _InputDecorator {
  final emailInput = InputDecoration(
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    hintText: LanguageItems.mailHint,
    labelText: LanguageItems.mailTitle,
    alignLabelWithHint: true,
  );
}
