import 'package:flutter/material.dart';

class TestFinalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestFinalDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('TestFinalDemo')),
          body: TestFinal(),
        ),
      )
    );
  }
}
class TestFinal extends StatelessWidget {
  final List<int> ints = [];
  final int myInt = 1;
  void _add(){
    ints.add(1);
    print(ints);
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: ElevatedButton(child: Text('测试'),onPressed: _add,),);
  }
}