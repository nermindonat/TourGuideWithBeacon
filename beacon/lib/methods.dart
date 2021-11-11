import 'dart:convert';

import 'package:beacon/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

scanBeacon(BuildContext context) {
  FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  var scanDevices =
      flutterBlueInstance.scan().listen((scanResult) {}).onData((data) {
    log("beacon " + data.toString());
    log("beacon " + jsonEncode(data.advertisementData.serviceUuids));
    log("data.rssi " + data.rssi.toString());
    var x = (-80 - data.rssi) / (10 * 2);
    if (x > 0) {
      log("distance: " + x.toString() + " metre");
    }
  });
}

Future<String> summarizeMethod() async {
  log("ta");
  var x = await http.post(
    Uri.parse('https://turkcemetinozetleme.teaddict.net/ozetle/api/new'),
    headers: <String, String>{
      "access-control-allow-headers": "accept, content-type",
      "access-control-allow-methods": "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH",
      "access-control-allow-origin": "*",
      "content-encoding": "gzip",
      "content-type": "application/json; charset=utf-8",
      "date": "Thu, 11 Nov 2021 12:36:05 GMT",
      "server": "nginx/1.10.3"
    },
    body: jsonEncode({
      "contextOfText":
          "1996 yılı içinde Selçuk, Aydın ve Efes yol üçgeninin yaklaşık 100 m kadar güney batısında, mandalina bahçeleri arasında Derbent Çayı'nın kıyısında Çukuriçi Höyük saptanmıştır. Arkeolog Adil Evren başkanlığında yapılan araştırma ve kazılar sonucu, bu höyükte taş ve bronz baltalar, iğneler, açkılı seramik parçaları, ağırşaklar, obsidien (volkanik cam) ve sileks (çakmak taşı), deniz kabukluları, öğütme ve perdah aletleri bulunmuştur. Yapılan değerlendirmelerle Çukuriçi Höyük'te Neolitik dönemden Erken Bronz Çağına kadar bir yerleşimin ve yaşamın olduğu saptanmıştır. Aynı tür malzemeler yine Selçuk, Kuşadası yolunun yaklaşık 8. km'de Arvalya Deresi'nin bitişiğinde Gül Hanım tarlasında Arvalya Höyük saptanmıştır. Çukuriçi ve Arvalya (Gül Hanım) höyüklerinde saptanan eserler ile Efes'in yakın çevresinin tarihi böylece Neolitik Dönem'e kadar ulaşmaktadır."
    }),
  );
  log("x.statusCode" + x.statusCode.toString());
  log("x.body :: ");
  log("x.body :: " + jsonDecode(x.body).toString());
  var decode = jsonDecode(x.body);
  return decode["result"];
}
