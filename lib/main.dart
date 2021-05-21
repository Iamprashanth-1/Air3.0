import 'dart:async';

import 'package:floaty_head/floaty_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'report.dart';
import 'live.dart';
import 'ss.dart';
import 'usage.dart';

Future<void> main() async {
  runApp(MaterialApp(
      title: "Konnex",
      theme: new ThemeData(
        primaryColor: Color(0xFF083386), // Your app THEME-COLOR
      ),
      debugShowCheckedModeBanner: false,
      home: Home()));
}

class Home extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final FloatyHead floatyHead = FloatyHead();

  final header = FloatyHeadHeader(
    title: FloatyHeadText(
        fontWeight: FontWeight.bold,
        text: "Welcome to Konnex Bubble",
        fontSize: 16,
        padding: FloatyHeadPadding.setSymmetricPadding(12, 12),
        textColor: Colors.white),
    button: FloatyHeadButton(
      text: FloatyHeadText(
          padding: FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
          fontWeight: FontWeight.bold,
          text: "Chat bot",
          fontSize: 12,
          textColor: Colors.white),
      tag: "focus_button",
      width: 0,
      padding: FloatyHeadPadding(left: 10, right: 10, bottom: 10, top: 10),
      height: FloatyHeadButton.WRAP_CONTENT,
      decoration: FloatyHeadDecoration(
          startColor: Color.fromRGBO(250, 139, 97, 1),
          endColor: Color.fromRGBO(247, 28, 88, 1),
          borderWidth: 0,
          borderRadius: 30.0),
    ),
  );

  final body = FloatyHeadBody(
    rows: [
      EachRow(
        columns: [
          EachColumn(
            text: FloatyHeadText(
                padding:
                    FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
                fontWeight: FontWeight.bold,
                text: "Updated body",
                fontSize: 12,
                textColor: Colors.black45),
          ),
        ],
        gravity: ContentGravity.center,
      ),
      EachRow(columns: [
        EachColumn(
          text: FloatyHeadText(
              padding:
                  FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
              text: "Updated long data of the body",
              fontSize: 12,
              textColor: Colors.black87,
              fontWeight: FontWeight.bold),
          padding: FloatyHeadPadding.setSymmetricPadding(6, 8),
          decoration: FloatyHeadDecoration(
              startColor: Colors.black12, borderRadius: 25.0),
          margin: FloatyHeadMargin(top: 4),
        ),
      ], gravity: ContentGravity.center),
      EachRow(
        columns: [
          EachColumn(
            text: FloatyHeadText(
                fontWeight: FontWeight.bold,
                padding:
                    FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
                text: "Notes",
                fontSize: 10,
                textColor: Colors.black45),
          ),
        ],
        gravity: ContentGravity.left,
        margin: FloatyHeadMargin(top: 8),
      ),
    ],
    padding: FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
  );

  final footer = FloatyHeadFooter(
    buttons: [
      FloatyHeadButton(
        text: FloatyHeadText(
            padding:
                FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
            fontWeight: FontWeight.bold,
            text: "App Usage",
            fontSize: 12,
            textColor: Colors.white),
        tag: "focus_button",
        width: 0,
        padding: FloatyHeadPadding(left: 10, right: 10, bottom: 10, top: 10),
        height: FloatyHeadButton.WRAP_CONTENT,
        decoration: FloatyHeadDecoration(
            startColor: Color.fromRGBO(250, 139, 97, 1),
            endColor: Color.fromRGBO(247, 28, 88, 1),
            borderWidth: 0,
            borderRadius: 30.0),
      ),
      FloatyHeadButton(
        text: FloatyHeadText(
            padding:
                FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
            fontWeight: FontWeight.bold,
            text: "Bug Report",
            fontSize: 12,
            textColor: Colors.white),
        tag: "focus_button",
        width: 0,
        padding: FloatyHeadPadding(left: 10, right: 10, bottom: 10, top: 10),
        height: FloatyHeadButton.WRAP_CONTENT,
        decoration: FloatyHeadDecoration(
            startColor: Color.fromRGBO(250, 139, 97, 1),
            endColor: Color.fromRGBO(247, 28, 88, 1),
            borderWidth: 0,
            borderRadius: 30.0),
      ),
      FloatyHeadButton(
        text: FloatyHeadText(
            padding:
                FloatyHeadPadding(left: 16, right: 16, bottom: 12, top: 12),
            fontWeight: FontWeight.bold,
            text: "Live Support",
            fontSize: 12,
            textColor: Colors.white),
        tag: "focus_button",
        width: 0,
        padding: FloatyHeadPadding(left: 10, right: 10, bottom: 10, top: 10),
        height: FloatyHeadButton.WRAP_CONTENT,
        decoration: FloatyHeadDecoration(
            startColor: Color.fromRGBO(250, 139, 97, 1),
            endColor: Color.fromRGBO(247, 28, 88, 1),
            borderWidth: 0,
            borderRadius: 30.0),
      ),
    ],
    padding: FloatyHeadPadding(left: 16, right: 16, bottom: 12),
    decoration: FloatyHeadDecoration(startColor: Colors.white),
    buttonsPosition: ButtonPosition.center,
  );

  bool alternateColor = false;

  @override
  void initState() {
    super.initState();
    FloatyHead.registerOnClickListener(callBack);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Konnex',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xFF083386),
          toolbarHeight: 66,
        ),
        drawer: Container(
          color: Color(0xFF083386),
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  arrowColor: Color(0xFF083386),
                  accountName: Text("User"),
                  accountEmail: Text("User@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      "U",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text("Contact Us"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlatButton(
                  color: Color(0xFF083386),
                  child: Text('Open Bubble',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    floatyHead.openBubble();
                    floatyHead.updateFloatyHeadContent(
                      header: header,
                      footer: footer,
                    );
                  }),
              FlatButton(
                  color: Color(0xFF083386),
                  child: Text('Close Bubble',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => closeFloatyHead()),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text('Set icon Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => setIcon()),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text('Set close icon Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => setCloseIcon()),
              FlatButton(
                color: Color(0xFF083386),
                child: Text('Chat bot', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
              FlatButton(
                color: Color(0xFF083386),
                child:
                    Text('Live support', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApps()),
                  );
                },
              ),
              FlatButton(
                color: Color(0xFF083386),
                child: Text('App Usage', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usage()),
                  );
                },
              ),
              FlatButton(
                color: Color(0xFF083386),
                child: Text('Report', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Report()),
                  );
                },
              ),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text('Set close background Icon Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => setCloseIconBackground()),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text(
              //         'Set notification title to: OH MY GOD! THEY KILL KENNY!!! Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => setNotificationTitle()),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text('Set notification Icon Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => setNotificationIcon()),
              // FlatButton(
              //     color: Color(0xFF083386),
              //     child: Text('Set Custom Header into Floaty Chathead',
              //         style: TextStyle(color: Colors.white)),
              //     onPressed: () => floatyHead.updateFloatyHeadContent(
              //           header: header,
              //           footer: footer,
              //         )),
            ],
          ),
        ),
      );

  void setCustomHeader() {
    floatyHead.updateFloatyHeadContent(
      header: header,
      body: body,
      footer: footer,
    );
  }

  void closeFloatyHead() {
    if (floatyHead.isOpen) {
      floatyHead.closeHead();
    }
  }

  Future<void> setNotificationTitle() async {
    String result;
    try {
      result = await floatyHead
          .setNotificationTitle("OH MY GOD! THEY KILL KENNY!!!");
    } on PlatformException {
      result = 'Failed to get icon.';
    }
    if (!mounted) return;
  }

  Future<void> setNotificationIcon() async {
    String result;
    String assetPath = "assets/notificationIcon.png";
    try {
      result = await floatyHead.setNotificationIcon(assetPath);
      print(result);
    } on PlatformException {
      result = 'Failed to get icon.';
      print("failed: $result");
    }
    if (!mounted) return;
  }

  Future<void> setIcon() async {
    String result;
    String assetPath = "assets/chatheadIcon.png";
    try {
      result = await floatyHead.setIcon(assetPath);
    } on PlatformException {
      result = 'Failed to get icon.';
    }
    if (!mounted) return;
  }

  Future<void> setCloseIcon() async {
    String assetPath = "assets/close.png";
    try {
      await floatyHead.setCloseIcon(assetPath);
    } on PlatformException {
      return;
    }
    if (!mounted) return;
  }

  Future<void> setCloseIconBackground() async {
    String assetPath = "assets/closeBg.png";
    try {
      await floatyHead.setCloseBackgroundIcon(assetPath);
    } on PlatformException {
      return;
    }
    if (!mounted) return;
  }

  Widget callBack(String tag) {
    print('CALLBACK FROM FRAGMENT BUILDED: $tag');
    if (tag == "simple_button") {
      print("Focus button has been called");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Report()),
      );
    }
    // switch (tag) {
    //   case "simple_button":
    //     return Report();
    //   case "updated_simple_button":
    //     break;
    //   case "focus_button":
    //     print("Focus button has been called");
    //     break;
    //   default:
    //     print("OnClick event of $tag");
    // }
  }
}
