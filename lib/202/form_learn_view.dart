import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Learn View"),
      ),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            const Text("Form Learn View"),
            TextFormField(
              validator: (value) {
                return FormFieldValidator().isNotEmpty(value);
              },
            ),
            TextFormField(
              validator: (value) {
                return FormFieldValidator().isNotEmpty(value);
              },
            ),
            DropdownButtonFormField(
              validator: (value) {
                return FormFieldValidator().isNotEmpty(value);
              },
              items: const [
                DropdownMenuItem(value: 'v', child: Text('a')),
                DropdownMenuItem(value: 'v2', child: Text('a2')),
                DropdownMenuItem(value: 'v3', child: Text('a3')),
              ],
              onChanged: (value) {
                print(value);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    if (kDebugMode) {
                      print('okey');
                    }
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : "Please enter some text";
  }
}
