import 'dart:developer' as dev;

import 'package:beacon/summarizeText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


Future<String> getDescription(context,index) async {
  final firestoreInstance = FirebaseFirestore.instance;
  var response = await firestoreInstance.collection("Artifacts").doc(index.toString()).get();  //// burayı değiştir
  dev.log("veri: " + response.data()["description"]);
  String z = response.data()["description"];
  var y = await summarizeMethod(z);
  
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Metinlerin üzerine tıklayarak sesli dinleyebilirsiniz.")));
  return y;
}
