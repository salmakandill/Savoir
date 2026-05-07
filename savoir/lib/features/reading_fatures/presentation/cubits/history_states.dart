import 'package:savoir/features/reading_fatures/data/models/book_history_model.dart';

abstract class HistoryStates {}

final class IntialHistoryState extends HistoryStates {}

final class LoadingHistoryState extends HistoryStates {}

final class SuccessHistoryState extends HistoryStates {
  final List<BookHistoryModel> books;

  SuccessHistoryState(this.books);
}

final class FaluierHistoryState extends HistoryStates {
    final String message;

  FaluierHistoryState(this.message);
}
