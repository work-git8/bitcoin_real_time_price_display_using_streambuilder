import 'dart:convert';

import 'package:api_fetching_flutter/bitcoin_model.dart';
import 'package:http/http.dart' as http;


// to get bitcoin price data

Future<Bitcoin> getBitcoinPrice() async {
  final response = await http
      .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
  return Bitcoin.fromJson(jsonDecode(response.body));
}
