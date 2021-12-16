import 'dart:math';

import 'package:beacon/description-list.dart';
import 'package:beacon/get-description.dart';
import 'package:beacon/login.dart';
import 'package:beacon/register.dart';
import 'package:beacon/scan-beacon.dart';
import 'package:beacon/select-city.dart';
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
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
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
        centerTitle: true,
        title: Text(widget.title,
          style: TextStyle(fontSize: 20.0, color: Colors.white))),
      
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
                              style: TextStyle(
                                fontSize: 16
                              ),
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
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
