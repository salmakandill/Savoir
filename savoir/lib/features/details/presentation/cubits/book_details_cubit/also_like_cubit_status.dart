import 'package:savoir/features/details/data/models/also_liked_books_model.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<AlsoLikedBooksModel> books;
  SimilarBooksSuccess({required this.books});
}

class SimilarBooksError extends SimilarBooksState {
  final String errMessage;
  SimilarBooksError({required this.errMessage});
}
