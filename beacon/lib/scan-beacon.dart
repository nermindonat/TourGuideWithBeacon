import 'dart:convert';
import 'dart:developer';

import 'package:beacon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ScanBeacon extends StatefulWidget {
  ScanBeacon({Key key}) : super(key: key);

  @override
  _ScanBeaconState createState() => _ScanBeaconState();
}

class _ScanBeaconState extends State<ScanBeacon> {
  var distanceStr = "0";
  var beaconId = "";
  bool isBeaconScanning = false;
  scanBeacon(BuildContext context) {
  FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  log(flutterBlueInstance.isScanning.isBroadcast.toString());
  if (flutterBlueInstance.isScanning.isBroadcast) {    
      flutterBlueInstance.scan().listen((scanResult) {}).onData((data) {
        setState(() {
          isBeaconScanning = true;
        });
    var distance = (-80 - data.rssi) / (10 * 2);
    if (distance > 0) {
      log("distance: " + distance.toString() + " metre");
    distanceStr=distance.toString();
    
    log("beacon " + jsonEncode(data.advertisementData.toString()));
    setState(() {
      if (data.advertisementData.serviceUuids.isNotEmpty && distance.toString()!=null ) {
      beaconId =  jsonEncode(data.advertisementData.serviceUuids.first).substring(1,data.advertisementData.serviceUuids.first.length-1);
      distanceStr = distance.toString()+" m";
   flutterBlueInstance.stopScan();
      }
    }); 
    return distanceStr;
    } else return distanceStr;
  });
  return distanceStr;
  
  } else {
  flutterBlueInstance.stopScan();
  }
  

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
        title: Text(
          "BEACONLARI TARA",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
        
        body: Stack(
          children: [
            Center(
              child: Container(
                height: 100,
                child: GestureDetector(
                  onTap: (){
                   
                    if (distanceStr!="0"&&beaconId!="") {
                       setState(() {
                      isBeaconScanning = false;
                      distanceStr = "0";
                      beaconId = "";
                    });
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                    }
                  },
                  child: distanceStr!="0"&&beaconId!=""? Container(
                    child: Row(
                      children: [
                        Expanded(flex:1,child: FlutterLogo()),
                        Expanded(flex: 7,child: Text(beaconId,style: TextStyle(fontSize: 12),)),
                        Expanded(flex:3,child: Row(
                          children: [
                            SizedBox(width: 8,),
                            Text("Mesafe:"),
                            Text(distanceStr.toString(),overflow: TextOverflow.ellipsis,),
                          ],
                        )),
                      ],
                    ),
                  ) :
                  isBeaconScanning? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Beaconlar Taran??yor.."),
                        SizedBox(height: 8,),
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      ],
                    ),
                  ):Center(child: Text("Beaconlar?? taramak i??in butonu kullanabilirsiniz"),),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    distanceStr = scanBeacon(context);
                  });
                },
                
                child: Container(
                  width: double.infinity,
                  height: 75,
                  color: Color(0xffFFDA32),
                  child: Center(child: Text("BEACON TARAMA")),
                ),
              ),
            )
          ],
        ),
    );
  }
}
