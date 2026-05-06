class GenreModel {
  final List<String> genres;

  GenreModel({required this.genres});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    var genresRaw = json['genres'] as List;

    List<String> flatList = genresRaw
        .expand((i) => i as List)
        .map((e) => e.toString())
        .toList();

    return GenreModel(genres: flatList);
  }
}
