class AlsoLikedBooksModel {
  final int id;
  final String? title;
  final String? category;
  final String? image;

  AlsoLikedBooksModel({
    required this.id,
    this.title,
    this.category,
    this.image,
  });

  factory AlsoLikedBooksModel.fromJson(Map<String, dynamic> json) {
    return AlsoLikedBooksModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      image: json['image_url'] ?? '',
    );
  }
}
