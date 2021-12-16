import 'dart:developer';

import 'package:beacon/get-user.dart';
import 'package:beacon/mediaquery.dart';
import 'package:beacon/scan-beacon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  bool showPassword = true;
  Future<bool> register(context,String email, String password,String password2) async {
  var returned = false;
  final firestoreInstance = FirebaseFirestore.instance;
  var map = {
            'email': email, // John Doe
            'password': password,
          };
  if(password.isEmpty||password2.isEmpty||email.isEmpty){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lütfen Bütün Alanları Eksiksiz Doldurunuz")));
  }
  else if (password!= password2) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Şifreler uyumlu değil")));
   returned = false;
  }
  else
  { 
  var response = await firestoreInstance.collection("users").doc(email).get();
  if (response.exists) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kayıtlı kullanıcı")));
      returned = false;
  }else{
  await firestoreInstance.collection("users").doc(email).set(map);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kayıt Başarılı")));
      returned = true;
  }
  }        
  return returned;
  
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.topLeft,
          children: [
            Container(
              width: deviceWidth(context),
              height: deviceHeight(context),
              color: Colors.grey[350],
              child: Column(
                children: [
                  SizedBox(height: deviceHeight(context) * 0.18),
                  SizedBox(height: deviceHeight(context) * 0.05),
                  Text("Kayıt Ekranı",),
                  SizedBox(height: deviceHeight(context) * 0.05),
                  formFieldArea(context, false, "Email", email, false),
                  SizedBox(height: deviceHeight(context) * 0.02),
                  formFieldArea(context, true, "Parola", password, true),
                  SizedBox(height: deviceHeight(context) * 0.02),
                  formFieldArea(context, true, "Parolayı Doğrula", password2, true),
                  SizedBox(height: deviceHeight(context) * 0.02),
                  registerButton(context),
                  SizedBox(height: deviceHeight(context) * 0.02),
                ],
              ),
            ),
            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_sharp))
          ],
        ),
      ),
    );
  }

  Widget registerButton(BuildContext context) {
    return SizedBox(
        width: deviceWidth(context) * 0.7,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                primary: Colors.blue,
                fixedSize: Size.fromHeight(50)),
            onPressed: () async{
              if (
              await register(context,email.text,password.text,password2.text)) {
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    ScanBeacon()), (Route<dynamic> route) => false);
                
              }
            },
            child: Text("KAYIT OL",
            )));
  }

  Widget formFieldArea(
      BuildContext context, bool isSuffixOpen, String hintText, TextEditingController controller, bool obscureOpen) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          width: deviceWidth(context) * 0.7,
          child: TextFormField(
            obscureText: obscureOpen == false ? false : showPassword,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.red,
              enabledBorder: outlineInputBorder(),
              disabledBorder: outlineInputBorder(),
              border: outlineInputBorder(),
              focusedBorder: outlineInputBorder(),
            ),
            controller: controller,
          ),
        ),
      
      ],
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.red, width: 1),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  GestureDetector openPasswordIcon(String iconPath) {
    return GestureDetector(
      onTap: () {
        showPassword = !showPassword;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8.0),
        
      ),
    );
  }
}
