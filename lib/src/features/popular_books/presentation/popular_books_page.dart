
import 'package:bookstore_app/src/features/popular_books/domain/popular_books_model.dart';
import 'package:bookstore_app/src/shared/widgets/purchase_widget.dart';

import 'package:bookstore_app/src/shared/constants.dart';
import 'package:flutter/material.dart';


class PopularBooksPage extends StatelessWidget {
  final PopBook? e;
  const PopularBooksPage({Key? key, required this.e}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: Navigator.of(context).pop),
                          ),
                          const Center(
                            child: Icon(Icons.bookmark_outline),
                          )
                        ],
                      ),
                    ),
                    //
                    Center(
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.network(e!.bookImage.toString()),
                       
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8),
                      child: Text(
                        capitalizeAllWord(e!.title.toString().toLowerCase()),
                        style: kHeaderTextStyle,
                      ),
                    ),
      
                    Text(
                      e!.author.toString(),
                      style: kAuthorTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Description',
                    style: kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(e!.description.toString()),
            ),
            const PurchaseWidget(numberOfBooks: 0)
          ],
        ),
      ),
    ));
  }
}

