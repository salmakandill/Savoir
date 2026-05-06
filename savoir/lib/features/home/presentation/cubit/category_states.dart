import 'package:savoir/features/home/data/models/books_model.dart';

abstract class HomeGenresStates {}

class HomeGenresInitialState extends HomeGenresStates {}

class HomeGenresLoadingState extends HomeGenresStates {}

class HomeGenresSuccessState extends HomeGenresStates {
  final List<String> allGenres;
  HomeGenresSuccessState(this.allGenres);
}

class HomeGenresFailureState extends HomeGenresStates {
  final String errorMessage;
  HomeGenresFailureState(this.errorMessage);
}
class CategoryBooksLoadingState extends HomeGenresStates {}

class CategoryBooksSuccessState extends HomeGenresStates {
  final List<BooksModel> books;
  CategoryBooksSuccessState(this.books);
}

class CategoryBooksFailureState extends HomeGenresStates {
  final String errorMessage;
  CategoryBooksFailureState(this.errorMessage);
}