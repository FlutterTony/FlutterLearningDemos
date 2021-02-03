import 'package:flutter/material.dart';

// 页面主框架
class BasicWidgetsDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasicWidgetsDemo', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    );
  }

}

// 主体页面
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Flutter的基础元件',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('基本元件演示!'),
            ),
          ),
        ],
      ),
    );
  }
}

// 顶部导航栏
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: '导航菜单',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
            flex: 5,
          ),
          Expanded(
            child: Text('5：1'),
            flex: 1,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}


