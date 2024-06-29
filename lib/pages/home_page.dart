import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uas_books_yandi/bloc/book_bloc.dart';
import 'package:uas_books_yandi/bloc/book_event.dart';
import 'package:uas_books_yandi/bloc/book_state.dart';
import 'package:uas_books_yandi/helper/data_theme.dart';
import 'package:uas_books_yandi/pages/list_book_page.dart';
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
              const SizedBox(height: 8),
              const Text(
                'Find your dream book according to your preferences and join to our family. What are you waiting for?',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a book',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: const [
                    SectionTitle(title: 'Popular Now'),
                    SizedBox(height: 8),
                    BookListView(),
                    SectionTitle(title: 'Bestsellers'),
                    SizedBox(height: 8),
                    BookListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListBookPage())),
          },
          child: Text(
            'See More',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc()..add(FetchBooks()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            // Assuming _buildShimmerEffect() provides properly constrained widgets
            return Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            return Container(
              width: double.infinity,
              height: 200.0,
              child: 
                Expanded(
                  // Wrap the ListView.builder with Expanded
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      var book = state.books[index];
                      return HorizontalBookItem(book: book);
                    },
                  ),
                ),
            );
          } else if (state is BookError) {
            return Center(child: Text(state.message));
          } else {
            return Container(); // Initial state or unhandled state
          }
        },
      ),
    );
  }
}

Widget _buildShimmerEffect() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 6, // Number of shimmer items
    itemBuilder: (context, index) {
      return Container(
        constraints: const BoxConstraints(
          minWidth: 160.0,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            child: Wrap(
              children: <Widget>[
                Container(
                  height: 140,
                  color: Colors.white,
                ),
                ListTile(
                  title: Container(
                    height: 20,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
