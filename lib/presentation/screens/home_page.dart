import 'package:bookstore_app/common_widgets/popular_book_widget.dart';
import 'package:bookstore_app/common_widgets/pseudo_app_bar.dart';
import 'package:bookstore_app/common_widgets/trending_book_widget.dart';
import 'package:bookstore_app/data/popular_books_networking.dart';
import 'package:bookstore_app/data/trending_books_networking.dart';
import 'package:bookstore_app/presentation/screens/trending_books_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  final controller1 = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularBooks = ref.watch(bestsellerFutureProvider);
    final trendingBooks = ref.watch(trendingBooksFutureProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Header
              const PseudoAppBar(),

              //Listview Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Now',
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      'Show all',
                      style: kMinorHeaderTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 245,
                child: Center(
                  child: popularBooks.when(
                    data: (bestseller) {
                      return ListView.builder(
                        itemCount: bestseller.results!.lists!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return BookWidget(
                              imageLink: bestseller.results!.lists![index]!
                                      .books![1]!.bookImage ??
                                  ' ',
                              bookName: capitalizeAllWord(bestseller.results!
                                      .lists![index]!.books![1]!.title ??
                                  " "),
                              authorName: capitalizeAllWord(bestseller.results!
                                      .lists![index]!.books![1]!.author ??
                                  " "));
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(error.toString()),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),

              //Listview Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Books',
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      'Show all',
                      style: kMinorHeaderTextStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: trendingBooks.when(
                    data: (trendingBooks) {
                      return ListView.builder(
                        itemCount: trendingBooks.results!.lists!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TrendingBooksPage(e: trendingBooks)),
                            ),
                            child: TrendingBookWidget(
                              imageLink: trendingBooks.results!.lists![index]!
                                      .books![2]!.bookImage ??
                                  " ",
                              bookTitle: trendingBooks.results!.lists![index]!
                                      .books![2]!.title ??
                                  " ",
                              bookAuthor: trendingBooks.results!.lists![index]!
                                      .books![2]!.author ??
                                  " ",
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(error.toString()),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
