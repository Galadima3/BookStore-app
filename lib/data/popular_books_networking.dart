import 'dart:convert';

import 'package:bookstore_app/domain/popular_books_model.dart';
import 'package:bookstore_app/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class PopularBookServices {
  final secondApiObject = ApiConstants();
  Future<PopularBooksModel> getPopularBooks() async {
    try {
      Response response = await get(Uri.parse(
          secondApiObject.popularBooksUrl+secondApiObject.apiKey));
      final output = PopularBooksModel.fromJson(jsonDecode(response.body));
      return output;
    } catch (e) {
      throw Exception('An error occured');
    }
  
  }
}

final bestsellerProvider = Provider<PopularBookServices>((ref) {
  return PopularBookServices();
});

final bestsellerFutureProvider = FutureProvider<PopularBooksModel>((ref) async {
  final apiService = ref.watch(bestsellerProvider).getPopularBooks();
  return apiService;
});
