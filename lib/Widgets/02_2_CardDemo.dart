import 'package:flutter/material.dart';

// 页面主框架
class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CardDemo', // used by the OS task switcher
        home: Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text('CardDemo'),
            ),
            body: Column(
              children: [
                Demo01(),
                Demo02(),
              ],
            ),
          ),
        ));
  }
}
class Demo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.restaurant_menu,color: Colors.blue,),
              title: Text('龙翔大道100号', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text('深圳，龙岗'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_phone,color: Colors.blue,),
              title: Text('1583548565', style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail,color: Colors.blue,),
              title: Text('costa@qq.com', style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
class Demo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.restaurant_menu,color: Colors.blue,),
            title: Text('龙翔大道102号', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: Text('深圳，龙岗'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contact_phone,color: Colors.blue,),
            title: Text('1583548565', style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail,color: Colors.blue,),
            title: Text('costa@qq.com', style: TextStyle(fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}

