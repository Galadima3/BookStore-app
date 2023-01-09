import 'dart:convert';
import 'package:bookstore_app/domain/trending_books_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart';

class TrendingBookServices {
  Future<TrendingBooksModel> getTrendingBooks() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=mhr8GAcCNC7I3VimBcaWFsEAa9B3Ms8M'));
          return TrendingBooksModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('An error occurred!');
    }
  }
}

final trendingBooksProvider = Provider<TrendingBookServices>((ref) {
  return TrendingBookServices();
});

final trendingBooksFutureProvider = FutureProvider<TrendingBooksModel>((ref) async {
  return ref.watch(trendingBooksProvider).getTrendingBooks();
});