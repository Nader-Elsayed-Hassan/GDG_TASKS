import 'dart:convert';

import 'package:http/http.dart' as http;

class WetherService {
  final String apiKey = "1f31f203336f4598a95170857251904";
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=1f31f203336f4598a95170857251904&q=$city"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
