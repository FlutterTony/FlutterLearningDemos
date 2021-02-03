import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('ProviderDemo')),
          body: _MyRoot(),
        ),
      )
    );
  }
}

class _MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(
      create: (context)=>MyModel(),
      child: _MyConsumer(),
    );
  }
}

class _MyConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyModel>(
      builder: (context, myModel, child){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green[200],
              child: RaisedButton(
                child: Text('搞一些事'),
                onPressed: (){ myModel.doSomething();},
              ),
            ),

            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Text(myModel.someValue),
            )
          ],
        );
      },
    );
  }
}
class MyModel{
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
