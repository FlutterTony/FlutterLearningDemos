import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueListenableProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueListenableProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('ValueListenableProviderDemo')),
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
              return ValueListenableProvider<String>.value(
                value: myModel.someValue,
                child: Consumer<String>(builder: (context, myValue, child)=>Text(myValue),),
              );
            } ,
          ),
        )
      ],
    );
  }
}


class MyModel{
  ValueNotifier<String> someValue = ValueNotifier('Hello'); // <--- ValueNotifier
  doSomething(){
    someValue.value += '-o';
    print(someValue.value);
  }
}
