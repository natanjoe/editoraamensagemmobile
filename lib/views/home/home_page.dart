import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/palette.dart';
import '../../models/book_model.dart';
import '../category/category_page.dart';
import '../details/book_details_page.dart';
import '../shared/book_card.dart';
import '../about/about_page.dart';
import '../donation/donation_page.dart';
import '../prayer/prayer_request_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> allBooks = [];
  List<Book> filteredBooks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    final String jsonData = await rootBundle.loadString('assets/data/books.json');
    final List<dynamic> decoded = json.decode(jsonData);
    final List<Book> books = decoded.map((e) => Book.fromJson(e)).toList();

    books.sort((a, b) => a.title.compareTo(b.title));

    setState(() {
      allBooks = books;
      filteredBooks = books;
    });
  }

  void filterBooks(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredBooks = allBooks
          .where((book) => book.title.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  void navigateToPrayerRequest(Book book) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PrayerRequestPage(),
        ),
      );
    }
    
  void navigateToCategory(String categoryKey) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryPage(
          category: categoryKey,
          books: allBooks,
        ),
      ),
    );
  }

  void navigateToDetails(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookDetailsPage(book: book),
      ),
    );
  }

  ListTile _buildDrawerItem(String title, String categoryKey) {
    return ListTile(
      leading: Icon(Icons.book, color: AppColors.primary),
      title: Text(title),
      onTap: () => navigateToCategory(categoryKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Livros'),
        backgroundColor: AppColors.primary,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.background,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: const Text(
                'Categorias',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
             ListTile(
              leading: Icon(Icons.edit_note, color: AppColors.primary),
              title: const Text('Pedidos de oração'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrayerRequestPage()),
                );
              },
            ),
            
            _buildDrawerItem('Sermões Traduzidos', 'traducoes'),
            _buildDrawerItem('Conduta, Ordem, Doutrina-C.O.D.', 'C.O.D.'),
            _buildDrawerItem('Sermões em série do Ano 1965 ', 'série 65'),
            _buildDrawerItem('A mensagem para crianças', 'crianças'),
            _buildDrawerItem('Biografias', 'biografias'),
            _buildDrawerItem('Bíblias de Estudo', 'bíblias de estudo'),
            _buildDrawerItem('Outros Autores', 'Outros Autores'),
                        
            ListTile(
              leading: Icon(Icons.volunteer_activism, color: AppColors.primary),
              title: const Text('Doações'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DonationPage()),
                );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.info, color: AppColors.primary),
              title: const Text('Quem Somos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),
           
            ListTile(
              leading: Icon(Icons.info, color: AppColors.primary),
              title: const Text('Sobre o sistema.'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar livro...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: filterBooks,
            ),
          ),
          Expanded(
            child: filteredBooks.isEmpty
                ? const Center(child: Text('Nenhum livro encontrado.'))
                : Padding(
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
                          onTap: () => navigateToDetails(book),
                          child: BookCard(book: book),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
