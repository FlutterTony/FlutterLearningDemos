import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // 定义元件的build方法，这个方法往往会在元件的构造函数中调用.
  // MyApp元件成为了应用的根元件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 配置元件的主题.
        // 利用热加载特性，如果将primarySwatch（材质样色）颜色更改，点击热加载按钮，预览视图会自动刷新，而数据缓存依然保持
        primarySwatch: Colors.blue,
        // visualDensity 视觉密度，
        // .adaptivePlatformDensity 适配平台的视觉密度。比如元件在桌面中比在移动端中更小、更紧密。
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MyHomePage'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  // MyHomePage的构造方法。其中{}中的参数为命名参数
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Hello World!',
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}