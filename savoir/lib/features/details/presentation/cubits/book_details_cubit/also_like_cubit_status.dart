import 'package:savoir/features/home/data/models/books_model.dart';

abstract class SimilarBooksState {}

class SimilarInitialBooks extends SimilarBooksState {}

class SimilarLoadingBooks extends SimilarBooksState {}

class SimilarSuccessBooks extends SimilarBooksState {
  final List<BooksModel> books;
  SimilarSuccessBooks({required this.books});
}

class SimilarFailureBooks extends SimilarBooksState {
  final String errMessage;
  SimilarFailureBooks({required this.errMessage});
}