import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProxyProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('ProxyProviderDemo')),
          body: _MyRoot(),
        ),
      )
    );
  }
}

class _MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ProxyProvider<MyModel, AnotherModel>(
            update: (context,myModel, anotherModel) => AnotherModel(myModel)
        ),
      ],
      child: _MyConsumers(),
    );
  }
}

class _MyConsumers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Row Rebuild');
    final _myModel = Provider.of<MyModel>(context, listen: false);
    final _anotherModel = Provider.of<AnotherModel>(context, listen: false);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.green[200],
          child: RaisedButton(
            child: Text('搞一些事'),
            onPressed: (){ _myModel.doSomething('my');},
          ),
        ),

        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.green[200],
          child: RaisedButton(
            child: Text('搞一些事'),
            onPressed: (){ _anotherModel.doSomething();},
          ),
        ),

        Container(
          padding: const EdgeInsets.all(35),
          color: Colors.blue[200],
          child: Consumer<MyModel>(
            builder: (context,myModel, child) {
              print('Text rebuild');
              return Text(myModel.someValue);
            } ,
          ),
        )
      ],
    );
  }
}


class MyModel with ChangeNotifier{
  String someValue = 'Hello';
  doSomething(String value){
    someValue += value;
    print(someValue);
    notifyListeners();
  }
}
class AnotherModel{
  MyModel _myModel;
  AnotherModel(this._myModel);
  doSomething(){
    _myModel.doSomething('another');
    print(_myModel.someValue);
  }
}
