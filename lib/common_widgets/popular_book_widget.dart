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
                bookName,
                style: const TextStyle(color: Colors.black),
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
