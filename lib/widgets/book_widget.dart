import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final Color color;
  final String bookName;
  const BookWidget({super.key, required this.color, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10),
      child: Column(
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            bookName,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
