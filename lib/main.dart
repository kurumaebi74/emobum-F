// フラッターで使うライブラリのインストール
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// これはStatelessWidgetである。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMOBUM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'EMOBUM'),
    );
  }
}
// これはstatefullwidget
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/profile.png"),
              TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.account_circle),
                hintText: '新しいIDを入力してください',
                labelText: 'ID',
                suffixIcon: Icon(Icons.border_color)
              ),
              validator: (value) {
                if (value.isEmpty){
                  return '必須';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.security),
                hintText: 'パスワードを入力してください',
                labelText: 'パスワード',
                suffixIcon: Icon(Icons.border_color),
              ),
              validator: (value) {
                if (value.isEmpty){
                  return '必須';
                }
                return null; 
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.mail),
                hintText: '名前を入力してください',
                labelText: 'メールアドレス',
                suffixIcon: Icon(Icons.border_color)
              ),
              validator: (value) {
                if (value.isEmpty){
                  return '必須';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
              onPressed: () {
              if (_formkey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text('Processing Data')
                ));
                }
              },
              child: const Text('submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
