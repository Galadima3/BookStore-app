import 'dart:convert';
import 'package:bookstore_app/domain/trending_books_model.dart';
import 'package:bookstore_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart';

class TrendingBookServices {
  final apiObject = ApiConstants();
  Future<TrendingBooksModel> getTrendingBooks() async {
    try {
      Response response =
          await get(Uri.parse(apiObject.trendingBooksUrl + apiObject.apiKey));
      return TrendingBooksModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('An error occurred!');
    }
  }
}

final trendingBooksProvider =
    Provider<TrendingBookServices>((ref) => TrendingBookServices());

final trendingBooksFutureProvider = FutureProvider<TrendingBooksModel>(
  (ref) async => ref.watch(trendingBooksProvider).getTrendingBooks(),
);
