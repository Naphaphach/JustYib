import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreditCard {
  final String picture;
  final String number;
  final String expire;

  CreditCard({this.expire, this.picture, this.number});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    // print(json);
    return CreditCard(
      picture: json['picture'] as String,
      number: json['cardNumber'] as String,
      expire: json['expire'] as String,
    );
  }

  static Future<List<CreditCard>> fetchCreditCards(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/creditcard.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(CreditCard.parseCreditCard, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<CreditCard> parseCreditCard(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CreditCard>((json) => CreditCard.fromJson(json)).toList();
  }
}
