import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kcapstone/models/menu.dart';

class Restaurant {
  final String picture;
  final String name;
  final int distance; // meter
  final String location;
  final String priceRate;

  final List<Menu> menus;

  Restaurant(
      {this.picture,
      this.name,
      this.distance,
      this.location,
      this.priceRate,
      this.menus});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    // print(json);
    try {
      List jsonMenu = json['menus'] as List;
      List<Menu> menus = jsonMenu.map((e) {
        return Menu.fromJson(e);
      }).toList();

      return Restaurant(
        picture: json['picture'] as String,
        name: json['name'] as String,
        distance: json['distance'] as int,
        location: json['location'] as String,
        priceRate: json['price'] as String,
        menus: menus,
      );
    } catch (e, s) {
      print(s);
      return Restaurant(
        picture: json['picture'] as String,
        name: json['name'] as String,
        distance: json['distance'] as int,
        location: json['location'] as String,
        priceRate: json['price'] as String,
      );
    }
  }

  static Future<List<Restaurant>> fetchRestaurants(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/restaurant.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Restaurant.parseRestaurant, s);
    });
  }

  static Future<List<Restaurant>> fetchForyouRestaurants(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/foryou.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Restaurant.parseRestaurant, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<Restaurant> parseRestaurant(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
  }
}
