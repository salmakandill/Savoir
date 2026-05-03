import 'package:savoir/features/details/data/models/also_liked_books_model.dart';

abstract class SimilarBooksState {}

class SimilarInitialBooks extends SimilarBooksState {}

class SimilarLoadingBooks extends SimilarBooksState {}

class SimilarSuccessBooks extends SimilarBooksState {
  final List<AlsoLikedBooksModel> books;
  SimilarSuccessBooks({required this.books});
}

class SimilarFailureBooks extends SimilarBooksState {
  final String errMessage;
  SimilarFailureBooks({required this.errMessage});
}
