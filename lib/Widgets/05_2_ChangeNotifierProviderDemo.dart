import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangeNotifierProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('ChangeNotifierProviderDemo')),
          body: _MyRoot(),
        ),
      )
    );
  }
}

class _MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context)=>MyModel(),
      child: _MyConsumers(),
    );
  }
}

class _MyConsumers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Row Rebuild');
    final _myModel = Provider.of<MyModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
        )
      ],
    );
  }
}
class MyModel with ChangeNotifier{
  String someValue = 'Hello';
  void doSomething() {
    someValue += '-o';
    print(someValue);
    notifyListeners();
  }
}
