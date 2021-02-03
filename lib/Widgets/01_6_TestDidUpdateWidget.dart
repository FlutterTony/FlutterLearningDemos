import 'package:flutter/material.dart';

// 页面主框架
class TestDidUpdateWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasicWidgetsDemo', // used by the OS task switcher
      home: Demo()
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<double> list = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestView(list, count),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add(null);
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


class TestView extends StatefulWidget {
  final List<double> list;
  final int count;
  TestView(this.list, this.count);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  // 注意：自身的setState不会引发didUpdateWidget，只有父元件的setState才会引发子元件的didUpdateWidget
  // 所以setState不会引发自身元件实例的改变，只会引发子元件实例的重绘。
  @override
  void didUpdateWidget(TestView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    print("list:${oldWidget.list.length}:${widget.list.length}");
    print("count:${oldWidget.count}:${widget.count}");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Container();
  }
}






