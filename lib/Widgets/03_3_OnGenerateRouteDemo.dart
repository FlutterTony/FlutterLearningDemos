import 'package:flutter/material.dart';
// 页面主框架
class OnGenerateRouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigatorNamedRouteDemo', // used by the OS task switcher
      onGenerateRoute: (setting){
        if(setting.name == '/'){
          return MaterialPageRoute(builder: (context)=>HomeScreen());
        }

        var uri = Uri.parse(setting.name);
        if(uri.pathSegments.length == 2 && uri.pathSegments.first=='details'){
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context)=>DetailScreen01(id:id));
        }

        return MaterialPageRoute(builder: (context)=>UnknownScreen());
      },
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('UnknownScreen'),),
        body: Column(
          children: [
            Center(child:Text('UnknownScreen')),
            ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('退出页面'))
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('NavigatorNamedRouteDemo'),),
        body: Column(
          children: [
            Center(child:Text('首页')),
            ElevatedButton(
                onPressed: ()=>Navigator.pushNamed(context, '/details/1'),
                child: Text('详情页')
            ),
            ElevatedButton(
                onPressed: ()=>Navigator.pushNamed(context, '/xxx'),
                child: Text('未知页面')
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen01 extends StatelessWidget {
  final String id;
  DetailScreen01({this.id});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('DetailScreen01'),),
        body: Column(
          children: [
            Center(child:Text('DetailScreen01__$id')),
            ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('退出页面'))
          ],
        ),
      ),
    );
  }
}



