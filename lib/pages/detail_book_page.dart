import 'package:flutter/material.dart';

class DetailBookPage extends StatelessWidget {
  final dynamic book;
  const DetailBookPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Logic to share the book details
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(book['formats']['image/jpeg'], fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                book['title'],
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.deepPurple),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Authors: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: book['authors']
                                .map((a) => a['name'])
                                .join(', '),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    RichText(
                      text: TextSpan(
                        text: 'Subjects: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: book['subjects'].join(', '),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    RichText(
                      text: TextSpan(
                        text: 'Languages: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: book['languages'].join(', '),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add bookmark functionality or other interactions
        },
        child: Icon(Icons.bookmark_border),
        tooltip: 'Bookmark',
      ),
    );
  }
}
