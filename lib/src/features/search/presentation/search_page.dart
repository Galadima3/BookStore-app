import 'package:bookstore_app/src/features/search/presentation/search_result_screen.dart';
import 'package:bookstore_app/src/shared/widgets/pseudo_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchFormKey = GlobalKey<FormState>();
    //final _data = ref.watch(searchDataProvider(searchTextController.text));
    void goToResultPage() {
      if (searchTextController.text.isNotEmpty &&
          searchFormKey.currentState!.validate()) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SearchResultScreen(
            searchTerm: searchTextController.text,
          ),
        ));
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const PseudoAppBar(),
            const SizedBox(
              height: 25,
            ),
            //Search Bar
            Form(
              key: searchFormKey,
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid search item';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) => goToResultPage(),
                            
                            //final _data = ref.watch(searchFutureProvider(value));

                            // _data.when(
                            //   data: (_data) {
                            //     List<SearchModel> resultList =
                            //         _data.map((e) => e).toList();

                            //     return Column(
                            //       children: [
                            //         Expanded(
                            //           child: ListView.builder(
                            //             itemCount: resultList.length,
                            //             itemBuilder: (context, index) {
                            //               return Card(
                            //                 child: ListTile(
                            //                   title: Text(resultList[index].items![index]!.volumeInfo!.authors.toString()),
                            //                 ),
                            //               );
                            //             },
                            //           ),
                            //         )
                            //       ],
                            //     );
                            //   },
                            // error: (error, stackTrace) {
                            //   Center(
                            //     child: Text(error.toString()),
                            //   );
                            // },
                            //   loading: () => const CircularProgressIndicator(),
                            // );
                          
                          controller: searchTextController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search for Books...',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
