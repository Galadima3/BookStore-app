import 'dart:convert';

import 'package:bookstore_app/src/features/search/domain/search_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class SearchApiService {
  //TODO: na here wahala dey
  Future<SearchModel> getSearchResults(List searchKeyword) async {
    var url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=${searchKeyword.join('+')}&key=AIzaSyBWl_R9Re4KKTDDpehC-vAYr5dQbxVc57M');
    //print(url);
    Response response = await get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      var rex = SearchModel.fromJson(jsonDecode(response.body));

      return rex;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final searchProvider = Provider<SearchApiService>((ref) => SearchApiService());
final searchFutureProvider =
    FutureProvider.family<SearchModel, List>((ref, searchPhrase) async {
  return ref.watch(searchProvider).getSearchResults(searchPhrase);
});
