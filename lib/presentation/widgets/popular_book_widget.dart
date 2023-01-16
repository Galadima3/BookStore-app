import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String imageLink;
  final String bookName;
  final String authorName;
  const BookWidget(
      {super.key,
      required this.imageLink,
      required this.bookName,
      required this.authorName});
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
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10),
      child: Column(
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(imageLink),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                capitalizeAllWord(bookName.toLowerCase()),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                authorName,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
