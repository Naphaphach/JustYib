import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile {
  final String picture;
  final String firstname;
  final String lastname;
  final String telephone;

  Profile({this.picture, this.firstname, this.lastname, this.telephone});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      picture: json['picture'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      telephone: json['telephone'] as String,
    );
  }

  static Future<Profile> fetchProfile(
      BuildContext context, http.Client client) async {
    Future<String> s =
        DefaultAssetBundle.of(context).loadString("resources/profile.json");

    return s.then((s) {
      // Use the compute function to run parsePhotos in a separate isolate
      return compute(Profile.parseProfiles, s);
    });
  }

  // A function that will convert a response body into a List<Photo>
  static Profile parseProfiles(String responseBody) {
    final parsed = json.decode(responseBody);
    return Profile.fromJson(parsed);
  }
}
