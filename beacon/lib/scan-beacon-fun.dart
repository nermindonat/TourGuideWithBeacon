import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

String scanBeacon(BuildContext context) {
  String distance = "0";
  FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  var scanDevices = flutterBlueInstance.scan().listen((scanResult) {}).onData((data) {
    log("beacon " + data.toString());
    log("beacon " + jsonEncode(data.advertisementData.serviceUuids));
    log("data.rssi " + data.rssi.toString());
    var x = (-80 - data.rssi) / (10 * 2);
    if (x > 0) {
      log("distance: " + x.toString() + " metre");
    distance=x.toString();
    return distance;
    } else return distance;
  });
  return distance;
}
