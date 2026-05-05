class MyListAddModel {
  final String id;
  final String? title;
  final String? listName;
  final String? description;

  MyListAddModel({
    required this.id,
    this.title,
    this.listName,
    this.description,
  });

  factory MyListAddModel.fromJson(Map<String, dynamic> json) {
    return MyListAddModel(
      id: json['id'],
      title: json['title'] ?? "Unknown Title",
      listName: json['list_name'] ?? "Unknown List",
      description: json['description'] ?? "No description available.",
    );
  }
}
