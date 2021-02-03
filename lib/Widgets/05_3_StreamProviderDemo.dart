import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamProviderDemo',
      home:Material(
        child: Scaffold(
          appBar: AppBar(title: Text('StreamProviderDemo')),
          body: _MyRoot(),
        ),
      )
    );
  }
}

class _MyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyModel>(
      initialData: MyModel(someValue: 'Default value'),
      create: (context)=>getStreamOfMyModel(),
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

Stream<MyModel> getStreamOfMyModel() { //  <--- async function
  return Stream<MyModel>.periodic(
      Duration(seconds: 1),
      (x) => MyModel(someValue: '$x')
  ).take(10);
}

class MyModel{
  MyModel({this.someValue});
  String someValue = 'Goodbye';
  doSomething(){
    someValue += '-o';
    print(someValue);
  }
}
