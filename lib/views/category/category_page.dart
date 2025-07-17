import 'package:flutter/material.dart';
import '../../models/book_model.dart';
import '../shared/book_card.dart';
import '../details/book_details_page.dart'; // <- IMPORTANTE!

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Book> books;

  const CategoryPage({Key? key, required this.category, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredBooks = books.where((book) => book.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria: ${_capitalize(category)}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: filteredBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final book = filteredBooks[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookDetailsPage(book: book),
                  ),
                );
              },
              child: BookCard(book: book),
            );
          },
        ),
      ),
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
