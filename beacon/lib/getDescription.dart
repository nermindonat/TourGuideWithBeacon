import 'package:cloud_firestore/cloud_firestore.dart';

getDescription() async {
  final firestoreInstance = FirebaseFirestore.instance;
  firestoreInstance.collection("Inventory").doc("1").get();
  }
