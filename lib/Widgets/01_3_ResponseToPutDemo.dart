import 'package:flutter/material.dart';

// 页面主框架
class ResponseToPutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasicWidgetsDemo', // used by the OS task switcher
      home: Scaffold(
        appBar: AppBar(title: Text('计数器示例'),),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(color: Colors.black12),
          child: Center(child: Counter(),),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget{
  @override
  _CounterState createState () => _CounterState();

}

class _CounterState extends State<Counter>{
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    // TODO: implement didUpdateWidget
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _increment, child: Text('增加')),
        Text('  计数器:$_counter'),
      ],);
  }

}


