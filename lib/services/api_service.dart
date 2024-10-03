import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay/config/config.dart';

class ApiService {
 var client = http.Client();

Future<Map<String,dynamic>> fetchImages({required page})async{
  try {
    String url = "${Config.baseUrl}page=$page";
    var res =await client.get(Uri.parse(url));
    if (res.statusCode == 200) {
       var body = jsonDecode(res.body);
       return {"status":"ok","data":body};
    } else {
    return {"status":"error", "message":"error of status code ${res.statusCode}"};
      
    }
  } catch (e) {
    return {"status":"error", "message":e.toString()};
  }
}

}