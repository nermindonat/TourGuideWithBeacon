import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<String> summarizeMethod(String text) async {
  log("ta");
  var response = await http.post(     //Verilen URL'ye verilen başlıklar ve gövde ile bir HTTP POST isteği gönderir.
    Uri.parse('https://turkcemetinozetleme.teaddict.net/ozetle/api/new'),
    headers: <String, String>{
      "access-control-allow-headers": "accept, content-type",
      "access-control-allow-methods": "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH",
      "access-control-allow-origin": "*",  // Tüm domaim isteklerine izin verir.
      "content-encoding": "gzip",  //istemcilerin sıkıştırılmış bir yanıtı kabul etme isteklerini işaret etmelerine izin vermek istediğimde ve sunucu sıkıştırıp sıkıştırmayacağına dair son söze sahip olduğunda 
      "content-type": "application/json; charset=utf-8",
      "date": "Thu, 11 Nov 2021 12:36:05 GMT",
      "server": "nginx/1.10.3"
    },
    body: jsonEncode({"contextOfText": text}),
  );
  log("response.statusCode" + response.statusCode.toString());
  var decode = jsonDecode(response.body);
  return decode["result"];
}
