import 'package:hive/hive.dart';
import 'package:savoir/features/home/data/models/books_model.dart';

part 'book_history_model.g.dart';

@HiveType(typeId: 0)
class BookHistoryModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String imageUrl;

  BookHistoryModel({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.id,
  });
  factory BookHistoryModel.getBooks(BooksModel book) {
    return BookHistoryModel(
      title: book.title ?? '',
      author: book.authors ?? 'unknown',
      imageUrl: book.imageUrl ?? '',
      id: book.id,
    );
  }
}
