import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Restaurant {
  final String picture;
  final String name;
  final int distance; // meter
  final String location;
  final int priceRate;

  Restaurant(
      {this.picture, this.name, this.distance, this.location, this.priceRate});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      picture: json['picture'] as String,
      name: json['name'] as String,
      distance: json['distance'] as int,
      location: json['location'] as String,
      priceRate: json['priceRate'] as int,
    );
  }

  static Future<List<Restaurant>> fetchPhotos(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/restaurant.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Restaurant.parsePhotos, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<Restaurant> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
  }
}
