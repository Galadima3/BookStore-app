

import 'package:bookstore_app/common_widgets/book_widget.dart';
import 'package:bookstore_app/common_widgets/pseudo_app_bar.dart';
import 'package:bookstore_app/common_widgets/trending_book_widget.dart';
import 'package:flutter/material.dart';


import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List bookInfo = [
    ['Welcome to Heaven on earth', Colors.red, 'James Browning'],
    ['Atlantis', Colors.green, 'Kevin Rock'],
    ['Synergy', Colors.indigo,'Dave Chapelle'],
    ['Revenge', Colors.amber, 'Myles Munroe'],
    ['Grace', Colors.deepPurple, 'Bobby Brown']
  ];
  final List trendingBooksInfo = [
    [Colors.red, 'Welcome', 'Mylez', 5.0],
    [Colors.green, 'Atlantis', 'Abeedah', 4.5],
    [Colors.indigo, 'Synergy', 'Jack', 3.8],
    [Colors.amber, 'Revenge', 'Maloney', 4.7],
    [Colors.deepPurple, 'Grace', 'James', 5.0]
  ];
  final controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookInfo.length,
                    itemBuilder: (context, index) {
                      return BookWidget(
                        bookName: bookInfo[index][0],
                        color: bookInfo[index][1],
                        authorName: bookInfo[index][2],
                      );
                    },
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
                child: ListView.builder(
                  itemCount: trendingBooksInfo.length,
                  itemBuilder: (context, index) {
                    return TrendingBookWidget(
                        color: trendingBooksInfo[index][0],
                        bookTitle: trendingBooksInfo[index][1],
                        bookAuthor: trendingBooksInfo[index][2],
                        bookRating: trendingBooksInfo[index][3]);
                  },
                ),
              )
              //const TrendingBookWidget(color: Colors.blue, bookTitle: 'Goat', bookAuthor: 'Mylez', bookRating: 4.78,)
            ],
          ),
        ),
      ),
    );
  }
}
