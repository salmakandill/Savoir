class BookModel {
  final String id;
  final String title;
  final String author;
  final String listType;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.listType,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      listType: json['listType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'author': author, 'listType': listType};
  }
}
