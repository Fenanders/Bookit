// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ItemBook extends StatefulWidget {
  final String title;
  final String data;

  const ItemBook({super.key, required this.title, required this.data});

  @override
  State<ItemBook> createState() => _ItemBookState();
}

class _ItemBookState extends State<ItemBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Laskar Pelangi'),
          SizedBox(height: 16.0,),
          Text('Genre')
        ],
      ),
    );
  }
}