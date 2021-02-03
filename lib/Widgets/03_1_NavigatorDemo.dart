import 'package:flutter/material.dart';
// 页面主框架
class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NavigatorDemo', // used by the OS task switcher
        home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  MaterialPageRoute _getRoute(){
    return MaterialPageRoute(builder: (context)=>DetailScreen01());
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('HomeScreen'),),
        body: Column(
          children: [
            Center(child:Text('首页')),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, _getRoute()),
              child: Text('详情页')
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('DetailScreen01'),),
        body: Column(
          children: [
            Center(child:Text('DetailScreen01')),
            ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('退出页面'))
          ],
        ),
      ),
    );
  }
}



