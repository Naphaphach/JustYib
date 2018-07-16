import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter/material.dart';

class Nearby {
  final String picture;
  final String name;
  final int distance; // meter
  final String location;

  Nearby({this.picture, this.name, this.distance, this.location});

  factory Nearby.fromJson(Map<String, dynamic> json) {
    return Nearby(
      picture: json['picture'] as String,
      name: json['name'] as String,
      distance: json['distance'] as int,
      location: json['location'] as String,
    );
  }

  static Future<List<Nearby>> fetchPhotos(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/restaurant.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Nearby.parsePhotos, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<Nearby> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Nearby>((json) => Nearby.fromJson(json)).toList();
  }
}
