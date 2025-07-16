import 'package:flutter/material.dart';
import '../../models/book_model.dart';
import '../../core/constants/palette.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              book.imageUrl,
              height: 300,
              fit: BoxFit.contain,
            ),
            
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            Text(
              book.subtitle,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,),
            ),
            
            const SizedBox(height: 16),
            Text(
              book.description ?? 'Sem descrição disponível no momento.',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            
            const SizedBox(height: 8),
            Text(
              book.author.isNotEmpty ? 'Autor: ${book.author}' : 'Autor não informado',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),
            Text(
              book.price.isNotEmpty ? 'Preço: ${book.price}' : 'Preço indisponível',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
