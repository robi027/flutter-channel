import 'package:flutter/material.dart';
import 'package:flutter_channel/native_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String title = "Text will change with native value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () async {
                setTitle("Text will change with native value");
                setTitle(await NativeChannel().sendToNative("From Flutter"));
              },
              child: Text("Change Text"),
            )
          ],
        ),
      ),
    );
  }

  setTitle(String value) {
    title = value;
    setState(() {});
  }
}
