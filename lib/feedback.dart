import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class Feedbackss extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed back',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFF083386),
      ),
      home: MyHomePage(title: 'Konnex Feedback'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<UserModel> createUser(String name, String jobTitle) async {
  final String apiUrl = "https://1c40c38609ab.ngrok.io/sendfeedback";

  final response =
      await http.post(apiUrl, body: {"name": name, "job": jobTitle});

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'description',
              ),
              controller: jobController,
            ),
            SizedBox(
              height: 32,
            ),
            FlatButton(
              color: Color(0xFF083386),
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                final String name = nameController.text;
                final String jobTitle = jobController.text;

                final UserModel user = await createUser(name, jobTitle);
              },
            )
          ]),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
