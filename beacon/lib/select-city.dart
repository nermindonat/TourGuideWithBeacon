import 'dart:developer';

import 'package:beacon/scan-beacon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key key}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  getCityList()async{
      final firestoreInstance = FirebaseFirestore.instance;
  var response = await firestoreInstance.collection("citylist").doc("citylist").get();
  log(response.data()["cityList"].runtimeType.toString());
  log(response.data()["cityList"][0].toString());
  log(response.data()["cityList"][0]["image"]);
  return response.data()["cityList"];
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("ŞEHİR SEÇİMİ",
          style: TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: FutureBuilder(
        future: getCityList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState!=ConnectionState.done ?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScanBeacon()));
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading:Image.network(snapshot.data[index]["image"]),
            title: Text(snapshot.data[index]["title"]),
            subtitle: Text(snapshot.data[index]["subtitle"]),
          );
        },
      );
        },
      ),
    );
  }
}