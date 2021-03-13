import './network_helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({this.cryptoCurrency, this.nativeCurrency});

  final String cryptoCurrency;
  final String nativeCurrency;

  Future getData() async {
    NetworkHelper networkHelper = NetworkHelper(
        cryptoCurrency: cryptoCurrency, nativeCurrency: nativeCurrency);

    var data = await networkHelper.getData();

    return data;
  }
}
