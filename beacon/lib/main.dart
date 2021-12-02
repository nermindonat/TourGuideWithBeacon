import 'dart:math';

import 'package:beacon/descriptionList.dart';
import 'package:beacon/getDescription.dart';
import 'package:beacon/scanbeacon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  String summarize = "";
  int randomInt = 0;
  bool loading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () async {
                    if (!loading) {
                      setState(() {
                        loading = true;
                        summarize = "";
                      });
                      int random = Random().nextInt(3);
                      setState(() {
                        randomInt = random;
                      });
                      summarize = await getDescription(random);
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: !loading
                          ? Text(
                              'Metin Özeti için Tıklayın',
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text("METİN"),
                color: Colors.amber,
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        child: Text(
                      descriptionList[randomInt],
                    )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Text("ÖZET"),
                color: Colors.amber,
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        child: Text(
                      summarize,
                    ))
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              scanBeacon(context);
            },
            child: Container(
              width: double.infinity,
              height: 75,
              color: Colors.red,
              child: Center(child: Text("BEACON TARAMA")),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
