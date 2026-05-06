class BookDetailsModel {
  final int id;
  final String? title;
  final String? image;
  final String? description;
  final double? rating;
  final String? authorid;
  final String? authorname;
  final String? pages;
  final String? language;

  BookDetailsModel({
    required this.id,
    this.title,
    this.image,
    this.description,
    this.rating,
    this.authorid,
    this.authorname,
    this.pages,
    this.language,
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
      authorid: json['author_id'] ?? '',
      authorname: json['author_name'] ?? '',
      pages: json['pages'] ?? 'Unknown',
      language: json['language'] ?? 'Unknown',
    );
  }
}
