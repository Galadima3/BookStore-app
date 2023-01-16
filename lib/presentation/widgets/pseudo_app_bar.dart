import 'package:flutter/material.dart';

class PseudoAppBar extends StatelessWidget {
  const PseudoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
