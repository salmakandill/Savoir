class BooksModel {
  final int id;
  final String? title;
  final String? imageUrl;
  final String? authors;
  final String? description;

  BooksModel({
    required this.id,
    this.title,
    this.imageUrl,
    this.authors,
    this.description,
  });
  factory BooksModel.getfromjson(Map<String, dynamic> json) {
    return BooksModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'no title',
      imageUrl: json['image'] ?? '',
      authors: json['authors'] != null && json['authors'].isNotEmpty
          ? json['authors'][0]['name'] ?? 'Unknown Author'
          : 'Unknown Author',
      description: json['description'],
    );
  }
}
