class BookDetailsModel {
  final int id;
  final String? title;
  final String? image;
  final String? description;
  final double? rating;
  final List<String>? authors;

  BookDetailsModel({
    required this.id,
    this.title,
    this.image,
    this.description,
    this.rating,
    this.authors,
  });

  factory BookDetailsModel.fromJson(
    Map<String, dynamic> json,
    List<String> authorsList,
  ) {
    return BookDetailsModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'] != null
          ? (json['rating']['average'] as num).toDouble()
          : 0.0,
      authors: authorsList,
    );
  }
}
