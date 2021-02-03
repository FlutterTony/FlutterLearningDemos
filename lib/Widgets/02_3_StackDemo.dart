import 'package:flutter/material.dart';

// 页面主框架
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StackDemo', // used by the OS task switcher
        home: Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text('StackDemo'),
            ),
            body: Demo01(),
          ),
        ));
  }
}
class Demo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/2.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text('Tony',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ],
    );
  }
}

