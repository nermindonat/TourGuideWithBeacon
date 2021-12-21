import 'dart:developer' as dev;
import 'dart:math';

import 'package:beacon/description-list.dart';
import 'package:beacon/get-description.dart';
import 'package:beacon/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyHomePage(),));
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
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  String summarize = "";
  int randomInt = 0;
  bool isSpeechActive = false;
  FlutterTts flutterTts = FlutterTts();
  bool loading = false;
  textToSpeech(String text)async{
    if (isSpeechActive) {
      
    flutterTts.stop();
    
    setState(() {
      isSpeechActive = !isSpeechActive;
    });
    } else {
      
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    
    setState(() {
      isSpeechActive = !isSpeechActive;
    });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Özetleme",
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
                      summarize = await getDescription(context,random);
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
                        child: GestureDetector(
                          onTap: (){
                            
                      textToSpeech(
                                              descriptionList[randomInt]);
                          },
                          child: Text(
                                              descriptionList[randomInt],
                                            ),
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
                        child: GestureDetector(
                          onTap: (){
                            
                      textToSpeech(
                                              summarize);
                          },
                          child: Text(
                                              summarize,
                                            ),
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
