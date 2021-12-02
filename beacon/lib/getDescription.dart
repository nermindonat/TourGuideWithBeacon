import 'dart:developer' as dev;
import 'dart:math';

import 'package:beacon/methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getDescription(index) async {
  final firestoreInstance = FirebaseFirestore.instance;
  var x = await firestoreInstance.collection("Inventory").doc(index.toString()).get();
  dev.log("veri: " + x.data()["description"]);
  String z = x.data()["description"];
  var y = await summarizeMethod(z);
  dev.log("özet: " + y);
  return y;
}
