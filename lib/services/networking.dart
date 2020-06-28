import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response res = await http.get(url);
    if(res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    }else {
      print('error');
    }
  }

}