import 'dart:convert';
import 'package:flutter_rest_api1/modelos/reportes.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://137.184.120.127:5000';
}

class ApiService {
  static Future<List<Reportes>> fetchReportes() async {
    var client = http.Client();
    var uri = Uri.parse('${URLS.BASE_URL}/reportes');
    var response = await client.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List jsonResponseReportes = jsonResponse['reportes'];
      return jsonResponseReportes
          .map((reportes) => new Reportes.fromJson(reportes))
          .toList();
    } else {
      throw Exception('Fallo la carga de reportes de la API');
    }
  }
}
