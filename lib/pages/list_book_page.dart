import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_books_yandi/bloc/book_bloc.dart';
import 'package:uas_books_yandi/bloc/book_event.dart';
import 'package:uas_books_yandi/bloc/book_state.dart';
import 'package:uas_books_yandi/widgets/list_item_book.dart';

class ListBookPage extends StatefulWidget {
  const ListBookPage({super.key});

  @override
  State<ListBookPage> createState() => _ListBookPageState();
}

class _ListBookPageState extends State<ListBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BookBloc()..add(FetchBooks()),
        child: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookLoaded) {
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  var book = state.books[index];
                  return ListItemBook(book: book);
                },
              );
            } else if (state is BookError) {
              return Center(child: Text(state.message));
            } else {
              return Container(); // Initial state or unhandled state
            }
          },
        ),
      ),
    );
  }
}
