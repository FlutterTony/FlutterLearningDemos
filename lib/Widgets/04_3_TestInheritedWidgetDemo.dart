import 'package:flutter/material.dart';

class TestInheritedWidgetRebuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestInheritedWidgetRebuild',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('TestInheritedWidgetRebuild')),
          body: MyRoot(),
        ),
      )
    );
  }
}

class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  String _var = 'Hello';
  void _update(){
    setState(() {
      _var += 'b';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyRoot重构子树');
    return Column(
      children: [
        Text(_var),
        ElevatedButton(onPressed: _update, child: Text(_var),),
        Demo()
      ],
    );
  }
}



class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _id = 1;
  void _updateID(){
    setState(() {
      print('更新id');
      _id++;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('_________didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant Demo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('_________didUpdateWidget');
  }
  @override
  Widget build(BuildContext context) {
    print('Demo重构子树');
    return MyInheritedWidget(
        id:_id,
        child: Column(
          children: [
            MyChildButton(onPressCallBack: _updateID),
            MyChildText(),
            Opacity(opacity: 0.8,child: Container(color: Colors.red,child: Text('透明度'),),),
            MyChildState()
          ],
        )
    );
  }
}

class MyInheritedWidget extends InheritedWidget{
  final int id;

  MyInheritedWidget({Key key, @required this.id, @required Widget child}) : super(key: key, child: child){
   print('构建MyInheritedWidget');
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    // print('updateShouldNotify： ${id != oldWidget.id}');
    return id != oldWidget.id;
    // return false;
  }

  // 实现一个静态方法来获取自己的实例
  static MyInheritedWidget of(BuildContext context) {
    print('查询MyInheritedWidget实例');
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

}

class MyChildButton extends StatelessWidget {
  final Function onPressCallBack;

  const MyChildButton({Key key, @required this.onPressCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyChildButton重构子树');
    return Container(
      child: ElevatedButton(onPressed: ()=>onPressCallBack(),child: Text('更新id'),),
    );
  }
}
class MyChildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);
    print('MyChildText重构子树');
    return Container(
      child: Text(myInheritedWidget.id.toString())
    );
  }
}
class MyChildState extends StatefulWidget {
  @override
  _MyChildStateState createState() => _MyChildStateState();
}

class _MyChildStateState extends State<MyChildState> {
  int _id;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('xxxxxxxxxxxxxxxxxxxxxxdidChangeDependencies');
    setState(() {
      MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);
      _id = myInheritedWidget.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_MyChildStateState build');
    return Container(child: Text(_id.toString()),);
  }
}

