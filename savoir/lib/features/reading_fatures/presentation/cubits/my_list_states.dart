abstract class MyListState {}

class MyListInitialState extends MyListState {}

class MyListLoadingState extends MyListState {}

class MyListSuccessState extends MyListState {}

class MyListFailureState extends MyListState {
  final String error;
  MyListFailureState(this.error);
}
