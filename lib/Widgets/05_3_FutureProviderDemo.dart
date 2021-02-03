import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('FutureProviderDemo')),
          body: _MyRoot(),
        ),
      )
    );
  }
}

class _MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      initialData: MyModel(someValue: 'Default value'),
      create: (context)=>someAsyncFunctionToGetMyModel(),
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

Future<MyModel> someAsyncFunctionToGetMyModel() async { //  <--- async function
  await Future.delayed(Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel{
  MyModel({this.someValue});
  String someValue = 'Goodbye';
  Future<void> doSomething() async{
    await Future.delayed(Duration(seconds: 2));
    someValue += '-o';
    print(someValue);
  }
}
