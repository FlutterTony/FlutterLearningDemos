import 'package:flutter/material.dart';
// 页面主框架
class NavigatorNamedRouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigatorNamedRouteDemo', // used by the OS task switcher
      routes: {
        '/': (context)=>HomeScreen(),
        '/details': (context)=>DetailScreen01()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('命名路由示例HomeScreen'),),
        body: Column(
          children: [
            Center(child:Text('首页')),
            ElevatedButton(
                onPressed: ()=>Navigator.pushNamed(context, '/details'),
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



