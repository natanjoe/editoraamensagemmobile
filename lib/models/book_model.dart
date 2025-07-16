class Book {
  final String title;
  final String subtitle; // NOVO
  final String author;
  final String imageUrl;
  final String category;
  final String price; // NOVO
  final String description;

  Book({
    required this.title,
    this.subtitle = '',
    required this.author,
    required this.imageUrl,
    required this.category,
    this.price = '',
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      subtitle: json['subtitle'] ?? '',
      author: json['author'] ?? '',
      imageUrl: json['imageUrl'],
      category: json['category'],
      price: json['price'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
