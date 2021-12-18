import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> getRequest() async {
  String Ruta = "10.0.2.2:3000";
  var url = Uri.parse('http://$Ruta/api/stations');
  var response = await http.get(url);
  Map<String, dynamic> map = json.decode(response.body);
  List data = map["data"];
  return data;
}

Future getIdRequest(int codigo) async {
  String Ruta = "10.0.2.2:3000";
  var url = Uri.parse('http://$Ruta/api/stations/$codigo');
  var response = await http.get(url);
  Map<String, dynamic> map = json.decode(response.body);
  var data = map['stations'];
  print(data[0]);
  return data;
}
