import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:bookstore_app/widgets/book_widget.dart';
import 'package:bookstore_app/widgets/trending_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller1 = TextEditingController();
  List bookInfo = [
    ['Welcome', Colors.red],
    ['Atlantis', Colors.green],
    ['Synergy', Colors.indigo],
    ['Revenge', Colors.amber],
    ['Grace', Colors.deepPurple]
  ];
  List trendingBooksInfo = [
    [Colors.red, 'Welcome', 'Mylez', 5.0],
    [Colors.green, 'Atlantis', 'Abeedah', 4.5],
    [Colors.indigo, 'Synergy', 'Jack', 3.8],
    [Colors.amber, 'Revenge', 'Maloney', 4.7],
    [Colors.deepPurple, 'Grace', 'James', 5.0]
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded),
                    ),
                    const Text(
                      'Explore',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1665686304355-0b09b1e3b03c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                    )
                  ],
                ),
              ),

              //Search bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBarAnimation(
                  hintText: 'Search books',
                  textEditingController: controller1,
                  isOriginalAnimation: false,
                  trailingWidget:
                      const Icon(Icons.close, size: 20, color: Colors.black),
                  secondaryButtonWidget:
                      const Icon(Icons.search, size: 20, color: Colors.black),
                  buttonWidget:
                      const Icon(Icons.search, size: 20, color: Colors.black),
                  onFieldSubmitted: (String value) {
                    log(value);
                  },
                ),
              ),
              //Listview Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text('Popular Now', style: kHeaderTextStyle,),
                    Text('Show all', style: kMinorHeaderTextStyle,),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookInfo.length,
                    itemBuilder: (context, index) {
                      return BookWidget(
                        bookName: bookInfo[index][0],
                        color: bookInfo[index][1],
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
                    Text('Show all', style: kMinorHeaderTextStyle,)
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  itemCount: trendingBooksInfo.length,
                  itemBuilder: (context, index) {
                  return TrendingBookWidget(color: trendingBooksInfo[index][0], bookTitle: trendingBooksInfo[index][1], bookAuthor: trendingBooksInfo[index][2], bookRating: trendingBooksInfo[index][3]);
                },),
              )
              //const TrendingBookWidget(color: Colors.blue, bookTitle: 'Goat', bookAuthor: 'Mylez', bookRating: 4.78,)
            ],
          ),
        ),
      ),
    );
  }
}
