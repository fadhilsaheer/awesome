import 'package:flutter/material.dart';
import './coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String bitCoinValue = '?';
  String etherCoinValue = '?';
  String lightCoinValue = '?';

  List<DropdownMenuItem> getDropDownItem() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      dropDownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return dropDownItems;
  }

  @override
  void initState() {
    super.initState();
    fetchCoin('USD');
  }

  Future getCoinData(cryptoCurrency, nativeCurrency) async {
    CoinData coinData = CoinData(
        cryptoCurrency: cryptoCurrency, nativeCurrency: nativeCurrency);

    var value = await coinData.getData();
    return value['rate'].toInt().toString();
  }

  void fetchCoin(String currency) async {
    setState(() {
      selectedCurrency = currency;
      bitCoinValue = '...';
      etherCoinValue = '...';
      lightCoinValue = '...';
    });

    String btc = await getCoinData('BTC', currency);
    String eth = await getCoinData('ETH', currency);
    String ltc = await getCoinData('LTC', currency);

    setState(() {
      bitCoinValue = btc;
      etherCoinValue = eth;
      lightCoinValue = ltc;
    });
  }

  Card getCardTile(String cryptoCurrencyValue, String cryptCurrencyName) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptCurrencyName = $cryptoCurrencyValue $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                children: [
                  getCardTile(bitCoinValue, 'BTC'),
                  getCardTile(etherCoinValue, 'ETH'),
                  getCardTile(lightCoinValue, 'LTC'),
                ],
              )),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropDownItem(),
              onChanged: (value) {
                fetchCoin(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
