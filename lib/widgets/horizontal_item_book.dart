import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalItemBook extends StatelessWidget {
  final Map<String, String> book;

  const HorizontalItemBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            book['image']!,
            width: 80,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(book['title']!),
          SizedBox(height: 4),
          Text(book['price']!, style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
    ;
  }
}
