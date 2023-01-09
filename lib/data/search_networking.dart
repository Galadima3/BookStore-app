import 'dart:convert';
import 'dart:developer';

import 'package:bookstore_app/domain/search_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class SearchApiService {
  getSearchResults(String searchKeyword) async {
    Response response = await get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$searchKeyword&key=AIzaSyBWl_R9Re4KKTDDpehC-vAYr5dQbxVc57M'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['items'];
      //log(result.length.toString());

      final dex = result.map(((e) => SearchModel.fromJson(e))).toList();
      //log(dex.toString());
      return dex;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final searchProvider = Provider<SearchApiService>((ref) {
  return SearchApiService();
});


final searchFutureProvider =
    FutureProvider.family<SearchApiService, String>((ref, searchPhrase) async {
  return ref.watch(searchProvider).getSearchResults(searchPhrase);
//  print('Search Provider: $lex');
//  return lex;
});



