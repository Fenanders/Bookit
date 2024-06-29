import 'package:uas_books_yandi/bloc/book_event.dart';
import 'package:uas_books_yandi/bloc/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Importing dart:convert for json operations

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<FetchBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final response = await http.get(Uri.parse('https://gutendex.com/books/'));
        if (response.statusCode == 200) {
          var data = json.decode(response.body) as Map;
          emit(BookLoaded(data['results']));
        } else {
          emit(BookError('Failed to load books'));
        }
      } catch (e) {
        emit(BookError('Failed to load books: $e'));
      }
    });
  }
}
