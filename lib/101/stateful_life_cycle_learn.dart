import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';
  late final bool _isEven;

  @override
  void didChangeDependencies() {
    //statelerde tamamen bir update olması durumunda tekrar çağrılır. initState'ten sonra çalışır.
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    // widget değiştiğinde çalışır yani oldWidget ile yeni widget karşılaştırılır.
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      print('b');
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    // dispose sayfa öldüğünde çalışır. sayfadan çıkıldığında tetiklenir.
    // TODO: implement dispose
    super.dispose();
    print('alo');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _message = widget.message;
    _isEven = _message.length.isEven;
    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isEven) {
      _message += ' Çift';
    } else {
      _message += ' Tek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_message),
        ),
        body: widget.message.length.isEven
            ? TextButton(onPressed: () {}, child: Text(_message))
            : ElevatedButton(onPressed: () {}, child: Text(_message)));
  }
}
