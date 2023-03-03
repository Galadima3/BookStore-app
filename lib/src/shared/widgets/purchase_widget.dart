

import 'package:flutter/material.dart';

class PurchaseWidget extends StatelessWidget {
  final int numberOfBooks;
  const PurchaseWidget({
    Key? key,
    required this.numberOfBooks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('QTY'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        )),
                    Text(numberOfBooks.toString()),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove, size: 20))
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                color: const Color(0xFF01800D),
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
