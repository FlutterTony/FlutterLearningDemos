import 'package:flutter/material.dart';

class InheritedWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'InheritedWidgetDemo', // used by the OS task switcher
        home: InheritedWidgetTestContainer());
  }
}

class InheritedTestModel{
  final int count;
  const InheritedTestModel(this.count);
}

// 继承性组件，他的状态值可为树中其它组件所用。
// 也就是，子节点，可以通过of方法拿到最近的祖先节点的实例，来实现更改祖先的状态。
class MyInheritedWidget extends InheritedWidget {
  final InheritedTestModel inheritedTestModel;
  final Function reduce;
  final Function increment;

  MyInheritedWidget({
    Key key,
    @required this.inheritedTestModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
  }) : super(key: key, child: child);

  // 实现一个静态方法来获取自己的实例
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  // 实现一个过滤器，来过滤重构的条件。
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return inheritedTestModel != oldWidget.inheritedTestModel;
  }
}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build TestWidgetA');
    final myInheritedWidget = MyInheritedWidget.of(context);

    final inheritedTestModel = myInheritedWidget.inheritedTestModel;

    print('TestWidgetA 中count的值:  ${inheritedTestModel.count}');
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
          textColor: Colors.black,
          child: Text('+'),
          onPressed: myInheritedWidget.increment),
    );
  }
}


class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build TestWidgetB');
    final myInheritedWidget = MyInheritedWidget.of(context);

    final inheritedTestModel = myInheritedWidget.inheritedTestModel;

    print('TestWidgetB 中count的值:  ${inheritedTestModel.count}');

    return  new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Text('当前count:${inheritedTestModel.count}',style: TextStyle(fontSize: 20.0),),
    );
  }
}



class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build TestWidgetC');
    final myInheritedWidget = MyInheritedWidget.of(context);

    final inheritedTestModel = myInheritedWidget.inheritedTestModel;

    print('TestWidgetC 中count的值:  ${inheritedTestModel.count}');

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
          textColor: Colors.black,
          child: Text('-'),
          onPressed: myInheritedWidget.reduce),
    );
  }
}
/*----------------------------------------------------------------------*/
class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InheritedWidgetTestContainerState();
  }
}

class _InheritedWidgetTestContainerState extends State<InheritedWidgetTestContainer> {
  InheritedTestModel inheritedTestModel;

  _initData() {
    inheritedTestModel = InheritedTestModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _incrementCount() {
    setState(() {
      inheritedTestModel = InheritedTestModel(inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      inheritedTestModel = InheritedTestModel(inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
        inheritedTestModel: inheritedTestModel,
        increment: _incrementCount,
        reduce: _reduceCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('InheritedWidgetTest'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Text('我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of(context).size等\n就是通过InheritedWidget实现的',
                  style: TextStyle(fontSize: 20.0),),
              ),
              TestWidgetA(),
              TestWidgetB(),
              TestWidgetC(),
            ],
          ),
        ));
  }
}