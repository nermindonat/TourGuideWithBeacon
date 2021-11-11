import 'package:beacon/methods.dart';
import 'package:flutter/material.dart';

void main() => runApp(Info());

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child:FutureBuilder(
            future: summarizeMethod(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData?Text(snapshot.data):Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}