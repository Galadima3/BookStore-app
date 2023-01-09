import 'package:flutter/material.dart';

class TrendingBookWidget extends StatelessWidget {
  final String imageLink;

  final String bookTitle;
  final String bookAuthor;
  const TrendingBookWidget({
    Key? key,
    required this.imageLink,
    required this.bookTitle,
    required this.bookAuthor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),child: Image.network(imageLink),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints:  BoxConstraints.expand(height: bookTitle.length > 30 ? 40 : 20, width:230),
                  child: Text(
                    bookTitle,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                //const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 30, width:230),
                  child: Text(
                    bookAuthor,
                     overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
