import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sample {
  final String picture;
  final String name;
  final String status;
  final int price;


  Sample(
      {this.picture, this.name, this.status, this.price});

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        picture: json['picture'] as String,
        name: json['name'] as String,
        status: json['status'] as String,
        price: json['price'] as int,

    );
  }

  static Future<List<Sample>> fetchPhotos(
      BuildContext context, http.Client client) async {
    Future<String> s =
    DefaultAssetBundle.of(context).loadString("resources/sample.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Sample.parsePhotos, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<Sample> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Sample>((json) => Sample.fromJson(json)).toList();
  }
}
