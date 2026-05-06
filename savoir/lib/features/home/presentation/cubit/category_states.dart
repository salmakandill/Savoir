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
