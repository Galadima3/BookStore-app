import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TrendingBookWidget extends StatelessWidget {
  final Color color;
  final double bookRating;
  final String bookTitle;
  final String bookAuthor;
  const TrendingBookWidget(
      {Key? key,
      required this.color,
      required this.bookTitle,
      required this.bookAuthor,
      required this.bookRating})
      : super(key: key);

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
                color: color, borderRadius: BorderRadius.circular(12)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(
                  bookAuthor,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 5),
                RatingBarIndicator(
                  itemSize: 20,
                  rating: bookRating,
                  itemCount: 5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 110.0),
            child: SizedBox(
              height: 75,
              child: Center(
                child: Icon(
                  Icons.bookmark_border_outlined,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
