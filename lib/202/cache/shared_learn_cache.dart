import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  // Init:
  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  // Variables:
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  // Shared Manager Init:
  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // // Obtain shared preferences.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          _loading(context),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  // Loading Func:
  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : const SizedBox.shrink();
  }

  // Save Value Button:
  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save_alt_outlined),
      onPressed: () async {
        changeLoading();
        // // Obtain shared preferences.
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // // Save an integer value to 'counter' key.
        // await prefs.setInt('counter', _currentValue);
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  // Remove Value Button:
  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove_circle_outline_outlined),
      onPressed: () async {
        changeLoading();
        // // Obtain shared preferences.
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // // Remove data for the 'counter' key.
        // await prefs.remove('counter');
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

// User items from model:
class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('User 1', 'Description 1', 'https://picsum.photos/200/300'),
      User('User 2', 'Description 2', 'https://picsum.photos/200/300'),
    ];
  }
}

// Generic class for loading statefull
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
