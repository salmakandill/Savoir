import 'package:hive/hive.dart';

part 'my_list_model.g.dart';

@HiveType(typeId: 0)
class MyListModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String category;
  MyListModel({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.category,
  });
}
