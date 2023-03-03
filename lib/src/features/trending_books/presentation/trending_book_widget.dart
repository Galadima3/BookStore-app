import 'package:flutter/material.dart';

class TrendingBookWidget extends StatelessWidget {
  final String imageLink;

  final String bookTitle;
  final String bookAuthor;
  const TrendingBookWidget(
      {Key? key,
      required this.imageLink,
      required this.bookTitle,
      required this.bookAuthor})
      : super(key: key);

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
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 500
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(imageLink),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: bookTitle.length > 30 ? 40 : 20,
                            width: 230),
                        child: Text(
                          capitalizeAllWord(bookTitle.toLowerCase()),
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            const BoxConstraints.expand(height: 30, width: 230),
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
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(imageLink),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalizeAllWord(bookTitle.toLowerCase()),
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: 30, width: screenWidth < 500 ? 230 : 330),
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
