import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_books_yandi/pages/detail_book_page.dart';

class ListItemBook extends StatelessWidget {
  final dynamic book;
  
  const ListItemBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure it's in a flex-type parent if using Expanded
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailBookPage(book: book),
      ),
    );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(book['formats']['image/jpeg']),
              Text(book['title'], style: Theme.of(context).textTheme.headlineMedium),
              Text(book['authors'][0]['name'], style: Theme.of(context).textTheme.bodyMedium),
              IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () => _toggleBookmark(book['id']),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _toggleBookmark(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList('bookmarks') ?? [];

    if (bookmarks.contains(bookId)) {
      bookmarks.remove(bookId);
    } else {
      bookmarks.add(bookId);
    }

    await prefs.setStringList('bookmarks', bookmarks);
  }
}
