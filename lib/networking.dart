import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var d = await json.decode(json.encode(response.body));
      return jsonDecode(data);
      //return d;
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
