import 'package:flutter/material.dart';
import 'package:uas_books_yandi/helper/data_theme.dart';
import 'package:uas_books_yandi/widgets/horizontal_item_book.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover your best books now',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 8),
              Text(
                'Find your dream book according to your preferences and join to our family. What are you waiting for?',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a book',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    SectionTitle(title: 'Popular Now'),
                    SizedBox(height: 8),
                    BookListView(books: popularBooks),
                    SectionTitle(title: 'Bestsellers'),
                    SizedBox(height: 8),
                    BookListView(books: bestsellers),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> popularBooks = [
    {'title': 'Dracula', 'price': '\$22.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
    {'title': 'The Little Mermaid', 'price': '\$100.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
    {'title': 'A Million Dreams', 'price': '\$25.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
  ];

  final List<Map<String, String>> bestsellers = [
    {'title': 'Bette Lee Crosby', 'price': '\$20.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
    {'title': 'In the Company of Ghosts', 'price': '\$15.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
    {'title': 'The Other', 'price': '\$30.00', 'image': 'assets/images/cov_kaijuu8.jpg'},
  ];
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'See More',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}

class BookListView extends StatelessWidget {
  final List<Map<String, String>> books;

  const BookListView({required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          HorizontalItemBook(book: book);
        },
      ),
    );
  }
}
