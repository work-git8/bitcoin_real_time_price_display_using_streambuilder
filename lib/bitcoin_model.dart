
import 'package:meta/meta.dart';
import 'dart:convert';

Bitcoin bitcoinFromJson(String str) => Bitcoin.fromJson(json.decode(str));

String bitcoinToJson(Bitcoin data) => json.encode(data.toJson());

class Bitcoin {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  Bitcoin({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory Bitcoin.fromJson(Map<String, dynamic> json) => Bitcoin(
        time: Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: Bpi.fromJson(json["bpi"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi.toJson(),
      };
}

class Bpi {
  final Eur usd;
  final Eur gbp;
  final Eur eur;

  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: Eur.fromJson(json["USD"]),
        gbp: Eur.fromJson(json["GBP"]),
        eur: Eur.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
        "GBP": gbp.toJson(),
        "EUR": eur.toJson(),
      };
}

class Eur {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Eur({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

class Time {
  final String updated;
  final DateTime updatedIso;
  final String updateduk;

  Time({
    required this.updated,
    required this.updatedIso,
    required this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso.toIso8601String(),
        "updateduk": updateduk,
      };
}
