import 'dart:developer' as dev;

import 'package:beacon/summarizeText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getDescription(index) async {
  final firestoreInstance = FirebaseFirestore.instance;
  var response = await firestoreInstance.collection("Artifacts").doc(index.toString()).get();  //// burayı değiştir
  dev.log("veri: " + response.data()["description"]);
  String z = response.data()["description"];
  var y = await summarizeMethod(z);
  dev.log("özet: " + y);
  return y;
}
