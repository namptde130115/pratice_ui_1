import 'package:pratice_ui_1/models/advertisement.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Advertisement> fetchAdvertisement() async {
  final response =
      await http.get(Uri.parse('https://example.com/whatsit/create'));

  if (response.statusCode == 200) {
    return Advertisement.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Advertisement');
  }
}
