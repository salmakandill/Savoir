import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savoir/features/reading_fatures/data/models/book_history_model.dart';

class HistoryKeeper {
  static late Box<BookHistoryModel> historyBook;
  static const String boxName = 'reading_history';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(BookHistoryModelAdapter());

    historyBook = await Hive.openBox<BookHistoryModel>(boxName);
  }

  static List<BookHistoryModel> getCurrentlyReading() {
    return historyBook.values.toList();
  }

  static List<BookHistoryModel> getHistory() {
    return historyBook.values.toList();
  }

  static Future<void> deleteFromHistory(String id) async {
    await historyBook.delete(id);
  }

  static Future<void> addBook(BookHistoryModel book) async {
    await historyBook.put(book.id, book);
  }
}