import 'package:bookstore_app/src/features/search/data/search_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends ConsumerStatefulWidget {
  final List searchTerm;
  const SearchResultScreen({required this.searchTerm, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  // ignore: unused_field
  late Future _value;
  @override
  void initState() {
    _value = _getData();
    super.initState();
  }

  Future _getData() async {
    
    return SearchApiService().getSearchResults(widget.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(searchFutureProvider(widget.searchTerm));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search results'),
        ),
        body: searchResult.when(
          data: (data) => Center(
            
            child: ListView.builder(
              itemCount: searchResult.value!.items.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // child: ListTile(
                //   title: Text(searchResult.value!.items[index].volumeInfo.title),
                //   tileColor: Colors.grey,
                // ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(searchResult.value!.items[index].volumeInfo.title),
                      Text(searchResult.value!.items[index].volumeInfo.authors[0]),
                    ],
                  ),
                ),
              );
            },),
          ),
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    
    );
  }
}

