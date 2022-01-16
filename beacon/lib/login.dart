import 'dart:developer';

import 'package:beacon/get-user.dart';
import 'package:beacon/mediaquery.dart';
import 'package:beacon/register.dart';
import 'package:beacon/scan-beacon.dart';
import 'package:beacon/select-city.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: deviceWidth(context),
            height: deviceHeight(context),
            color: Colors.grey[350],
            child: Column(
              children: [
                SizedBox(height: deviceHeight(context) * 0.18),
                SizedBox(height: deviceHeight(context) * 0.05),
                Text("Giriş Ekranı",),
                SizedBox(height: deviceHeight(context) * 0.05),
                formFieldArea(context, false, "Email", email, false),
                SizedBox(height: deviceHeight(context) * 0.02),
                formFieldArea(context, true, "Parola", password, true),
                SizedBox(height: deviceHeight(context) * 0.02),
                loginButton(context),
                SizedBox(height: deviceHeight(context) * 0.02),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,  
                    MaterialPageRoute(builder: (context) => RegisterView()),
                    );            
                }, child: Text("KAYIT OL"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
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
              await login(context,email.text,password.text)) {
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    SelectCity()), (Route<dynamic> route) => false);
                
              }
            },
            child: Text("GİRİŞ YAP",
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
