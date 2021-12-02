import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

scanBeacon(BuildContext context) {
  FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  var scanDevices = flutterBlueInstance.scan().listen((scanResult) {}).onData((data) {
    log("beacon " + data.toString());
    log("beacon " + jsonEncode(data.advertisementData.serviceUuids));
    log("data.rssi " + data.rssi.toString());
    var x = (-80 - data.rssi) / (10 * 2);
    if (x > 0) {
      log("distance: " + x.toString() + " metre");
    }
  });
}
