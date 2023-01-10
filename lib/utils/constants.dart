import 'package:flutter/material.dart';

const kHeaderTextStyle = TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold);

final kMinorHeaderTextStyle = TextStyle(
    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.shade400);


class ApiConstants {
  String trendingBooksUrl =
      'https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=';
  String popularBooksUrl =
      'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=';
  String apiKey = 'mhr8GAcCNC7I3VimBcaWFsEAa9B3Ms8M';
}
