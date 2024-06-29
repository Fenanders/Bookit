import 'package:flutter/material.dart';

class HorizontalBookItem extends StatelessWidget {
  const HorizontalBookItem({
    super.key,
    required this.book,
  });

  // ignore: prefer_typing_uninitialized_variables
  final book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(book['formats']['image/jpeg'], height: 80.0, fit: BoxFit.fitWidth,),
            ListTile(
              title: Text(book['title']),
              subtitle: Text(book['authors'][0]['name']),
            ),
          ],
        ),
      ),
    );
  }
}
