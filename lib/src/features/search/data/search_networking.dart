import 'dart:convert';
import 'dart:developer';

import 'package:bookstore_app/src/features/search/domain/search_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class SearchApiService {
  Future<SearchModel> getSearchResults(String searchKeyword) async {
    try {
      var url = Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=\'$searchKeyword&key=AIzaSyBWl_R9Re4KKTDDpehC-vAYr5dQbxVc57M');
      Response response = await get(url);
      if (response.statusCode == 200) {
        var rex = SearchModel.fromJson(jsonDecode(response.body));
        return rex;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}

final searchProvider = Provider<SearchApiService>((ref) => SearchApiService());
final searchFutureProvider =
    FutureProvider.family<SearchModel, String>((ref, searchPhrase) async {
  return ref.watch(searchProvider).getSearchResults(searchPhrase);
});
