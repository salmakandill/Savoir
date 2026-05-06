// features/details/data/models/also_liked_books_model.dart
class AlsoLikedBooksModel {
  final int id;
  final String? title,subtitle;
  final String? image;

  AlsoLikedBooksModel({
    required this.id,
    this.title,
    this.subtitle,
    this.image,
  });

  factory AlsoLikedBooksModel.fromJson(Map<String, dynamic> json) {
    return AlsoLikedBooksModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'] ?? '',
    );
  }
}
