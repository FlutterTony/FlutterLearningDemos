import 'package:flutter/material.dart';

// 页面主框架
class StateFlowDirectionDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasicWidgetsDemo', // used by the OS task switcher
      home: Scaffold(
        appBar: AppBar(title: Text('计数器示例02'),),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(color: Colors.black12),
          child: Center(child: Counter(),),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text('计数器:$count');
  }
}

class CounterIncrementer extends StatelessWidget {
  CounterIncrementer({this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text('增加'));
  }

}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment(){
    setState(() {
      ++_counter;
    });
  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    _counter = 0;
  }

  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('ok');
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementer(onPressed: _increment),
        CounterDisplay(count: _counter)
      ],
    );
  }
}





