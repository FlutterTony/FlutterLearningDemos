import 'package:flutter/material.dart';

class TestRebuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestRebuild',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('TestRebuild')),
          body: Demo(),
        ),
      )
    );
  }
}
class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _id = 1;
  void _updateID(){
    setState(() {
      print('更新id');
      _id++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyChildButton(onPressCallBack: _updateID),
        MyChildText(id: _id)
      ],
    );
  }
}

class MyChildButton extends StatelessWidget {
  final Function onPressCallBack;

  const MyChildButton({Key key, @required this.onPressCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build MyChildButton');
    return Container(
      child: ElevatedButton(onPressed: ()=>onPressCallBack(),child: Text('更新id'),),
    );
  }
}
class MyChildText extends StatelessWidget {
  final int id;

  const MyChildText({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build MyChildText');
    return Container(
      child: Text(id.toString())
    );
  }
}
