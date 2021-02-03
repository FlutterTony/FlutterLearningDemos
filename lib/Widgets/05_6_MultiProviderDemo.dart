import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('MultiProviderDemo')),
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
        ChangeNotifierProvider<AnotherModel>(create: (context) => AnotherModel()),
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
            onPressed: (){ _myModel.doSomething();},
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
          child: Consumer<AnotherModel>(
            builder: (context,anotherModel, child) {
              print('Text rebuild');
              return Text(anotherModel.someValue.toString());
            } ,
          ),
        )
      ],
    );
  }
}


class MyModel with ChangeNotifier{
  String someValue = 'Hello';
  doSomething(){
    someValue += '-o';
    print(someValue);
    notifyListeners();
  }
}
class AnotherModel with ChangeNotifier{
  int someValue = 0;
  doSomething(){
    someValue++;
    print(someValue);
    notifyListeners();
  }
}
