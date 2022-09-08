import 'package:pratice_ui_1/models/advertisement.dart';
import 'package:http/http.dart' as http;

class AdvertisementService {
  Future<List<Advertisement>?> getAdvertisement() async {
    var client = http.Client();

    var uri =
        Uri.parse('https://631536ae5b85ba9b11dd5306.mockapi.io/advertisement');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
