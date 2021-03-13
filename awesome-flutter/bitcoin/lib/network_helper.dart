import 'package:http/http.dart' as http;
import 'dart:convert';

const restDomain = 'rest.coinapi.io';
const apikey = 'you-api-key';

class NetworkHelper {
  NetworkHelper({this.cryptoCurrency, this.nativeCurrency});

  final String nativeCurrency;
  final String cryptoCurrency;

  Future getData() async {
    Uri url = Uri.https(restDomain,
        '/v1/exchangerate/$cryptoCurrency/$nativeCurrency', {'apikey': apikey});

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    }
  }
}
