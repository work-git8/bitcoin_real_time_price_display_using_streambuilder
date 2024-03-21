import 'dart:async';

import 'package:api_fetching_flutter/api_service.dart';
import 'package:api_fetching_flutter/bitcoin_model.dart';
import 'package:flutter/material.dart';

class BitcoinPage extends StatefulWidget {
  const BitcoinPage({super.key});

  @override
  State<BitcoinPage> createState() => _BitcoinPageState();
}

class _BitcoinPageState extends State<BitcoinPage> {
  late StreamController<Bitcoin> _streamController;
  late Stream<Bitcoin> _stream;
  late Timer _timer;

  @override
  void initState() {
    _streamController = StreamController<Bitcoin>();
    _stream = _streamController.stream;

    fetchDataAddToStream();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchDataAddToStream();
    });

    super.initState();
  }

  fetchDataAddToStream() async {
    try {
      final bitcoin = await getBitcoinPrice();
      _streamController.add(bitcoin);
    } catch (e) {
      _streamController.addError(e);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Bitcoin>(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Faild to fetch data"),
            );
          } else if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/bitcoin.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "\$ ${snapshot.data!.bpi.usd.rate}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () => fetchDataAddToStream(),
                    child: Text("Refresh"))
              ],
            );
          } else {
            return Center(
              child: Text("Error in fetching data"),
            );
          }
        },
      ),
    );
  }
}
