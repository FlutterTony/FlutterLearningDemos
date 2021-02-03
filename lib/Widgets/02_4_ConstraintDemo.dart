import 'package:flutter/material.dart';

// 页面主框架
class ConstraintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ConstraintDemo', // used by the OS task switcher
        home: Material(
          child: Scaffold(
            appBar: AppBar(
              title: Container(child: Text('ConstraintDemo')),
            ),
            body: Demo01(),
          ),
        ));
  }
}
class Demo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.red,margin: EdgeInsets.all(10),width: 50,height: 50,),
                Container(color: Colors.red,margin: EdgeInsets.all(10),width: 50,height: 50,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.black,margin: EdgeInsets.all(10),width: 50,height: 50,),
                Container(color: Colors.black,margin: EdgeInsets.all(10),width: 50,height: 50,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

