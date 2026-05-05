import 'package:savoir/features/home/data/models/books_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<BooksModel> books;

  HomeSuccessState(this.books);
}

class HomeFailureState extends HomeStates {
  final String message;

  HomeFailureState(this.message);
}
