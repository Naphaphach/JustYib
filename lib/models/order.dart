import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderModel {
  final String picture;
  final String name;


  OrderModel({this.picture, this.name});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      picture: json['picture'] as String,
      name: json['name'] as String,

    );
  }

  static Future<List<OrderModel>> fetchPhotos(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/orderRes.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(OrderModel.parsePhotos, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static List<OrderModel> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
  }
}
