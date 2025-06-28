import 'dart:convert';
import 'api_keys.dart';
import 'package:http/http.dart' as http;

Future<String> getAddress(double latitude, double longitude) async {
  final apiKey = ApiKeys.geocodeApiKey;
  final url =
      'https://geocode-maps.yandex.ru/v1/?geocode=$longitude,$latitude&format=json&apikey=$apiKey&lang=uz_UZ&kind=house&rspn=1&results=1';
  
  try {
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      if (data['response']['GeoObjectCollection']['featureMember'].isEmpty) {
        throw Exception('No address found');
      }
      
      final address = data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['metaDataProperty']['GeocoderMetaData']['text'];
      return address;
    } else {
      print('Failed to load address. Status code: ${response} ${response.statusCode}');
      throw Exception('Failed to load address');
    }
  } catch (e) {
    print('Error occurred: $e');
    throw Exception('Error occurred: $e');
  }
}
