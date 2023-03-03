import 'dart:convert';


import 'package:bookstore_app/src/features/search/domain/search_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class SearchApiService {
  getSearchResults(String searchKeyword) async {
    try {
      Response response = await get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$searchKeyword&key=AIzaSyBWl_R9Re4KKTDDpehC-vAYr5dQbxVc57M'));
      final rex = SearchModel.fromJson(jsonDecode(response.body));

      return rex;
    } catch (e) {
      Exception('An error occurred');
    }
  }
}

final searchProvider = Provider<SearchApiService>((ref) => SearchApiService());

final searchFutureProvider =
    FutureProvider.family<SearchModel, String>((ref, searchPhrase) async {
  return ref.watch(searchProvider).getSearchResults(searchPhrase);
});
