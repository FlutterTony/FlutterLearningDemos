import 'package:flutter/material.dart';

// 页面主框架
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Grid View Demo', // used by the OS task switcher
        home: Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text('网格示例'),
            ),
            body: Demo02(),
          ),
        ));
  }
}

class Demo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      // children: [
      //   for(int i = 0;i<6;i++)
      //     GridTile(child: Container(color: Colors.green),footer: Text('ok'),)
      // ],
      children: List.generate(
          10,
          (index) => GridTile(
              child: Container(color: Colors.black12,child: Image.asset('assets/2.jpg'),),
              footer: Text(index.toString()))
      ),
    );
  }
}

class Demo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [for (int i = 0; i < 10; i++) Image.asset('assets/2.jpg')],
    );
  }
}
