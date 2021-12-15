import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
Future<bool> login(context,String email, String password) async {
  var returned = false;
  final firestoreInstance = FirebaseFirestore.instance;
  var response = await firestoreInstance.collection("users").doc(email.isEmpty?"asd":email).get();
  if (email.isEmpty || password.isEmpty) {
    
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Alanları eksiksiz doldurun")));
   returned = false;
  }
  else if(response.data()==null){

   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kullanıcı bulunamadı")));
   returned = false;
  }
  else if(response.data()!=null&&
    response.data()["password"]!=password){
    
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Şifre yanlış")));
   returned = false;
  }
  else{
    
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Giriş başarılı")));
   returned = true;
  }
  return returned;
  
}